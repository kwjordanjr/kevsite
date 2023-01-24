package backend

import (
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

func Server() error {
	// create our gin instance
	r := gin.Default()
	// list the html we want here
	files := []string{
		"frontend/index.html",
		"frontend/resume.html",
		"frontend/meta.html",
	}
	// load in all the html
	r.LoadHTMLFiles(files...)
	// register all our endpoints
	r.GET("/", func(c *gin.Context) {
		c.HTML(http.StatusOK, "index.html", nil)
	})
	r.GET("/resume", func(c *gin.Context) {
		c.HTML(http.StatusOK, "resume.html", nil)
	})
	r.GET("/meta", func(c *gin.Context) {
		c.HTML(http.StatusOK, "meta.html", nil)
	})
	// run gin server
	log.Fatal(r.Run(":9000"))
	return nil
}
