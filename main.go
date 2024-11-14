package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.Default()
	router.GET("/", getApi)
	err := router.Run("0.0.0.0:3000")
	if err != nil {
		fmt.Println(err)
		return
	}
}

func getApi(c *gin.Context) {
	c.String(200, "hello world")
}
