package main

import (
	"flag"
	"fmt"
	"log"

	tea "github.com/charmbracelet/bubbletea"
)

func main() {
	interactive := flag.Bool("i", false, "interactive mode")

	flag.Parse()

	if *interactive {

		p := tea.NewProgram(initialModel("hello"), tea.WithAltScreen())

		if _, err := p.Run(); err != nil {
			log.Fatal(err)
		}

	} else {
		fmt.Println("hello")
	}
}
