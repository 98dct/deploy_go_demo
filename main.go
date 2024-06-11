package main

import (
   "github.com/gin-gonic/gin"
   "os"
   "runtime"
   "fmt"
)

func main() {
	r := gin.Default()
        if len(os.Getenv("GOMAXPROCS")) == 0 {
                fmt.Println(runtime.NumCPU())
		runtime.GOMAXPROCS(runtime.NumCPU())
	}
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})
	r.Run(":9997") // 监听并在 0.0.0.0:9996 上启动服务
}
