package main

import (
	"log"
	"net/http"
	"text/template"
)

func HelloHandler(w http.ResponseWriter, _ *http.Request) {
	t, err := template.ParseFiles("static/index.html")
	if err != nil {
		http.Error(w, "Internal Server Error", http.StatusInternalServerError)
		log.Println("Error parsing template:", err)
		return
	}
	err = t.Execute(w, nil)
	if err != nil {
		http.Error(w, "Internal Server Error", http.StatusInternalServerError)
		log.Println("Error executing template:", err)
	}
}

func PostGameHandler(w http.ResponseWriter, r *http.Request) {

}
