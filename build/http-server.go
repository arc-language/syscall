// http-server.go
package main

import (
    "fmt"
    "net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
    w.Header().Set("Content-Type", "text/plain")
    w.Header().Set("Connection", "close")
    fmt.Fprintf(w, "Hello, World!\n")
}

func main() {
    fmt.Println("=== Go HTTP Server ===")
    fmt.Println("Listening on port 8080...")
    fmt.Println("Try: curl http://localhost:8080")
    
    http.HandleFunc("/", handler)
    http.ListenAndServe(":8080", nil)
}