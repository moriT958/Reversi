package main

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"
	"os"

	"github.com/joho/godotenv"
	_ "github.com/mattn/go-sqlite3"
)

func main() {

	godotenv.Load()
	dsn := os.Getenv("DATABASE_URL")
	db, err := sql.Open("sqlite3", dsn)
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	if err := db.Ping(); err != nil {
		log.Fatal(err)
	}
	log.Println("Success to connecting DB")

	board := InitBoard()
	fmt.Println(board)

	mux := http.NewServeMux()
	fileServer := http.FileServer(http.Dir("./static"))
	mux.Handle("/static/", http.StripPrefix("/static/", fileServer))
	mux.HandleFunc("/", HelloHandler)

	s := http.Server{
		Addr:    ":8080",
		Handler: mux,
	}
	log.Println("server started at", s.Addr)
	log.Fatal(s.ListenAndServe())
}
