package main

import "fmt" /**/

func f() string {
	return `package main

import "fmt" /**/

func f() string {
	return %c%s%c
}

func main() {
	/* */
	fmt.Printf(f(), 96, f(), 96)
}
`
}

func main() {
	/* */
	fmt.Printf(f(), 96, f(), 96)
}
