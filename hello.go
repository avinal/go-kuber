package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {
	hostName, _ := os.Hostname()
	response := fmt.Sprintf("Hello my hostname is %v\n", hostName)
	fmt.Print(response)

	http.HandleFunc("/", func(rw http.ResponseWriter, r *http.Request) { rw.Write([]byte(response)) })
}
