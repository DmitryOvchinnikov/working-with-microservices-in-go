package main

import (
	"fmt"
	"log"
	"net/http"

	"working-with-microservices-in-go/broker/pkg/app"
)

const webPort = "8080"

func main() {
	a := &app.App{}

	log.Printf("Starting broker-service service on port :%s\n", webPort)

	// define http server
	srv := &http.Server{
		Addr:    fmt.Sprintf(":%s", webPort),
		Handler: a.Routes(),
	}

	// start the server
	if err := srv.ListenAndServe(); err != nil {
		log.Panic(err)
	}
}
