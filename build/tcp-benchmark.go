package main


// sudo apt-get update
// sudo apt-get -y install apache2-utils

// Test with 1000 requests, 10 concurrent connections
// ab -n 1000 -c 10 http://localhost:8080/


import (
	"flag"
	"fmt"
	"io"
	"net"
	"sync"
	"sync/atomic"
	"time"
)

var (
	targetAddr   = flag.String("addr", "127.0.0.1:8080", "Target TCP address (host:port)")
	concurrency  = flag.Int("c", 50, "Number of concurrent workers (connections)")
	duration     = flag.Duration("d", 10*time.Second, "Duration of the test")
	message      = flag.String("msg", "Hello Arc!", "Message to send")
)

func main() {
	flag.Parse()

	fmt.Printf("🚀 Starting Benchmark against %s\n", *targetAddr)
	fmt.Printf("   Workers: %d\n", *concurrency)
	fmt.Printf("   Duration: %v\n", *duration)
	fmt.Println("------------------------------------------------")

	var (
		successCount uint64
		errorCount   uint64
		totalBytes   uint64
		wg           sync.WaitGroup
	)

	start := time.Now()
	deadline := start.Add(*duration)

	// Spawn workers
	for i := 0; i < *concurrency; i++ {
		wg.Add(1)
		go func(workerID int) {
			defer wg.Done()
			buf := make([]byte, 4096) // Reusable buffer per worker

			for time.Now().Before(deadline) {
				conn, err := net.DialTimeout("tcp", *targetAddr, 2*time.Second)
				if err != nil {
					atomic.AddUint64(&errorCount, 1)
					// Small sleep on error to prevent spinning tight loop on refused connection
					time.Sleep(10 * time.Millisecond)
					continue
				}

				// Set deadlines to prevent hanging workers
				conn.SetDeadline(time.Now().Add(2 * time.Second))

				// 1. Send Request
				_, err = conn.Write([]byte(*message + "\n"))
				if err != nil {
					conn.Close()
					atomic.AddUint64(&errorCount, 1)
					continue
				}

				// 2. Read Response
				// We read until EOF (server closes) or we get some data
				n, err := conn.Read(buf)
				if err != nil && err != io.EOF {
					conn.Close()
					atomic.AddUint64(&errorCount, 1)
					continue
				}

				// If we read > 0 bytes, we consider it a success
				if n > 0 {
					atomic.AddUint64(&successCount, 1)
					atomic.AddUint64(&totalBytes, uint64(n))
				} else {
					// Empty response is technically an error for this test
					atomic.AddUint64(&errorCount, 1)
				}

				conn.Close()
			}
		}(i)
	}

	// Progress ticker
	go func() {
		for {
			if time.Now().After(deadline) {
				return
			}
			time.Sleep(1 * time.Second)
			curSuccess := atomic.LoadUint64(&successCount)
			curErr := atomic.LoadUint64(&errorCount)
			elapsed := time.Since(start).Seconds()
			fmt.Printf("\r[Running] T: %.0fs | Reqs: %d | Errs: %d | RPS: %.0f   ", 
				elapsed, curSuccess, curErr, float64(curSuccess)/elapsed)
		}
	}()

	wg.Wait()
	totalTime := time.Since(start)

	fmt.Printf("\n\n------------------------------------------------\n")
	fmt.Printf("🛑 Benchmark Finished\n")
	fmt.Printf("------------------------------------------------\n")
	fmt.Printf("Total Time:     %v\n", totalTime)
	fmt.Printf("Total Requests: %d\n", successCount)
	fmt.Printf("Total Errors:   %d\n", errorCount)
	fmt.Printf("Total Bytes:    %d bytes\n", totalBytes)
	fmt.Printf("------------------------------------------------\n")
	
	rps := float64(successCount) / totalTime.Seconds()
	fmt.Printf("🔥 Requests/Sec: %.2f\n", rps)
	fmt.Printf("------------------------------------------------\n")

	if errorCount > 0 {
		fmt.Printf("Note: High error counts might be due to OS ulimit (open files) or ephemeral port exhaustion (TIME_WAIT).\n")
	}
}