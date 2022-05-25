//      xxxxx  x             xxxxxx
//     xx    xxx               xx
//    x       xx               xx
//   xx        x               xx
//   x                xxx      xx          xxxxx   xx  xxx     xxxx
//  xx              xx  xxx    xx         xx   xx xxxxx  xx   xx  xxxx
//  xx      xxxxxx  x    xx    xx         xx   xx  xx    xx  xx    xx
//  xx        xx   xx     xx   xx             xxx  xx    xx  xx    xx
//  xx        xx   xx     xx   xx           xx xx  xx    xx  xx    xx
//  xx        xx   xx     xx   xx          xx  xx  xx    xx   xx  xx
//   xx       xx   xx     xx   xx       x xx   xx  xx    xx    xxxx
//   xxx      xx    xx    x    xx      xx xx   xx  xx    xx  xx
//    xxx    xxx    xx   xx    xx     xx  xx  xxx  xx    xx  xxxxxxxx
//      xxxxxx       xxxx    xxxxxxxxxxx   xxx xxxxxxx  xxxx  xxxxxxxx
//                                                           x       x
//                                                          x        x
//                                                          xx      x
//                                                           xxxxxxx
package main

import (
	"fmt"
	"os"
	"os/exec"
	"runtime"
	"strconv"
	"time"
)

// Structure to hold ppl data
type person struct {
	name    string
	dollars int
	gallons float64
}

func main() {
	// Intro
	var scanned string
	var dTot int
	var gTot float64
	CallClear()
	fmt.Print("Welcome to Ice Cream Sharing Calc!\nHow many people are contributing to the ice cream fund?\n")

	// Total People input and int conversion
	fmt.Scanln(&scanned)
	numPpl := toInt(scanned)
	clearScreen()

	// Slice of person structs w/ len of numPPl
	var people = make([]person, numPpl)

	// Gallon total input
	fmt.Println("How many gallons total of ice cream are y'all getting?")
	fmt.Scanln(&scanned)
	gTot = toFloat(scanned)
	clearScreen()

	// For loop to declare people names and dollar amounts
	for i, person := range people {
		header(people, i-1)
		fmt.Printf("Hello person %d, what is your name?\n", i+1)
		fmt.Scanln(&person.name)
		fmt.Printf("How many dollars is %s putting in?\n$", person.name)
		fmt.Scanln(&scanned)
		person.dollars = toInt(scanned)
		dTot += person.dollars
		people[i] = person
		clearScreen()
	}
	fmt.Print("Split: ")

	//For loop calculating gallons per person and output
	for i, person := range people {
		person.gallons = (float64(person.dollars) / float64(dTot)) * gTot
		fmt.Printf("\n\t(%d) %s = %.2fg ", i+1, person.name, person.gallons)
		if i == numPpl-1 {
			fmt.Printf("\nTotal Gallons: %.2fg || Total Dollars: $%d\n\tCost per gallon: $%.2f\n\n", gTot, dTot, float64(dTot)/gTot)
		}
	}

}

// Takes People slice and prints header containing people data
func header(peeps []person, numInP int) {
	for i := 0; i <= numInP; i++ {
		fmt.Printf("%s: $%d", peeps[i].name, peeps[i].dollars)
		if i != numInP {
			fmt.Print(" || ")
		} else {
			fmt.Println()
		}
	}
}

// Takes string and returns converted int value
func toInt(inP string) int {
	if n, err := strconv.Atoi(inP); err == nil {
		return n
	} else {
		fmt.Println(inP, "is not an integer.")
		return 0
	}
}

// Takes string and returns converted float64 value
func toFloat(inP string) float64 {
	if n, err := strconv.ParseFloat(inP, 64); err == nil {
		return n
	} else {
		fmt.Println(inP, "is not a float.")
		return 0
	}
}

// Waits 1 second, then clears screen
func clearScreen() {
	time.Sleep(time.Second)
	CallClear()
}

// Clear Screen Code
// NOT MY CODE

var clear map[string]func() //create a map for storing clear funcs

func init() {
	clear = make(map[string]func()) //Initialize it
	clear["linux"] = func() {
		cmd := exec.Command("clear") //Linux example, its tested
		cmd.Stdout = os.Stdout
		cmd.Run()
	}
	clear["windows"] = func() {
		cmd := exec.Command("cmd", "/c", "cls")
		//Windows example, its tested
		cmd.Stdout = os.Stdout
		cmd.Run()
	}
}

func CallClear() {
	value, ok := clear[runtime.GOOS]
	if ok {
		//if we defined a clear func for that platform:
		value() //we execute it
	} else { //unsupported platform
		panic("Your platform is unsupported! I can't clear terminal screen :(")
	}
}
