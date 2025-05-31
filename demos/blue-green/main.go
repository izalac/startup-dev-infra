package main

import (
	"flag"
	"fmt"
	"net/http"
)

func main() {
	port := flag.String("port", "8001", "Specify the port for service")
	flag.Parse()

	http.HandleFunc("/", TestApp)
	http.ListenAndServe(":"+*port, nil)
}

func TestApp(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello world!")
}