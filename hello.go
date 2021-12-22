package main

import (
	"fmt"
	"os"
	"time"
)

func main() {
	hostName, _ := os.Hostname()
	for {
		fmt.Printf("Hello, my hostname is %v\n", hostName)
		time.Sleep(5 * time.Second)
	}
}
