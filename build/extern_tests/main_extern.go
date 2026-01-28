package main

import (
	"fmt"
	"log"
	"os"
	"os/exec"
	"path/filepath"
)

func main() {
	// --- Configuration ---
	wd, _ := os.Getwd()
	
	// Assume 'arc' binary is in the current directory (or cmd/arc)
	arcBin := filepath.Join(wd, "arc")
	if _, err := os.Stat(arcBin); os.IsNotExist(err) {
		// Fallback to checking cmd/ directory if running from root
		arcBin = filepath.Join(wd, "cmd", "arc") 
		if _, err := os.Stat(arcBin); os.IsNotExist(err) {
			log.Fatalf("❌ Could not find 'arc' compiler binary at %s", arcBin)
		}
	}

	testDir := filepath.Join(wd, "tests", "interop")
	if err := os.MkdirAll(testDir, 0755); err != nil {
		log.Fatalf("Failed to create test dir: %v", err)
	}

	// Paths for files
	cppSrc := filepath.Join(testDir, "lib.cpp")
	cppObj := filepath.Join(testDir, "lib.o")
	arcSrc := filepath.Join(testDir, "main.arc")
	arcObj := filepath.Join(testDir, "main.o")
	exeOut := filepath.Join(testDir, "main_extern")

	// Cleanup previous artifacts
	os.Remove(cppObj)
	os.Remove(arcObj)
	os.Remove(exeOut)

	fmt.Println("🚀 Starting Extern C++ Integration Test")
	fmt.Printf("   Work Dir: %s\n", testDir)
	fmt.Printf("   Compiler: %s\n", arcBin)

	// --- Step 1: Compile C++ ---
	fmt.Print("📦 [1/4] Compiling C++ Library... ")
	// -fno-rtti: Disables Run-Time Type Information to keep vtables simple (index 0 start)
	// -fPIC: Position Independent Code (needed for linking usually)
	cmdCpp := exec.Command("g++", "-c", cppSrc, "-o", cppObj, "-fno-rtti", "-fPIC")
	if out, err := cmdCpp.CombinedOutput(); err != nil {
		fmt.Printf("FAILED\n%s\n", string(out))
		os.Exit(1)
	}
	fmt.Println("OK")

	// --- Step 2: Compile Arc ---
	fmt.Print("🔮 [2/4] Compiling Arc Source... ")
	// ./arc build tests/interop/main.arc -o tests/interop/main.o
	cmdArc := exec.Command(arcBin, "build", arcSrc, "-o", arcObj)
	if out, err := cmdArc.CombinedOutput(); err != nil {
		fmt.Printf("FAILED\n%s\n", string(out))
		os.Exit(1)
	}
	fmt.Println("OK")

	// --- Step 3: Link ---
	fmt.Print("🔗 [3/4] Linking... ")
	// Use g++ to link so C++ standard libs are included
	cmdLink := exec.Command("g++", arcObj, cppObj, "-o", exeOut, "-no-pie")
	if out, err := cmdLink.CombinedOutput(); err != nil {
		fmt.Printf("FAILED\n%s\n", string(out))
		os.Exit(1)
	}
	fmt.Println("OK")

	// --- Step 4: Run ---
	fmt.Println("🏃 [4/4] Running Executable...")
	fmt.Println("----------------------------------------")
	cmdRun := exec.Command(exeOut)
	cmdRun.Stdout = os.Stdout
	cmdRun.Stderr = os.Stderr
	
	if err := cmdRun.Run(); err != nil {
		fmt.Printf("----------------------------------------\n")
		fmt.Printf("❌ Runtime Failed: %v\n", err)
		os.Exit(1)
	}
	fmt.Println("----------------------------------------")
	fmt.Println("✅ Test Passed!")
}