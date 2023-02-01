package main

import (
	"log"
	"os"

	"github.com/gin-gonic/contrib/static"
	"github.com/gin-gonic/gin"
)

func main() {
	// this will only be called for the production build
	if os.Getenv("GIN_MODE") == "RELEASE" {
		gin.SetMode(gin.ReleaseMode)
	}
	// create our gin instance
	r := gin.Default()
	// test endpoint for our react app
	r.Use(static.Serve("/", static.LocalFile("frontend/build", true)))
	// run gin server
	log.Fatal(r.Run(":9000"))
}
