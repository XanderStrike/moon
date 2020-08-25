package main

import (
	"fmt"
	"time"

	"github.com/IvanMenshykov/MoonPhase"
)

func main() {
	time := time.Now()
	m := MoonPhase.New(time)
	if m.PhaseName() == "Full Moon" {
		fmt.Println(m.PhaseName())
	} else {
		fmt.Println("Not full moon")
	}
}
