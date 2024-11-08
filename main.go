package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"net/http"
)

func main() {
	router := gin.Default()
	router.GET("/api", getApi)
	err := router.Run("0.0.0.0:8080")
	if err != nil {
		fmt.Println(err)
		return
	}
}

func getApi(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"Message": "successfully!",
		"Data":    "test for caddy",
	})
}
