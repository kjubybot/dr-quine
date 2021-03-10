package main

import "fmt"
import "io/ioutil"

func main() {
	s := `package main

import "fmt"
import "io/ioutil"

func main() {
	s := %c%s%c
	s = fmt.Sprintf(s, 96, s, 96)
	ioutil.WriteFile("Grace_kid.go", []byte(s), 0644)
}
`
	s = fmt.Sprintf(s, 96, s, 96)
	ioutil.WriteFile("Grace_kid.go", []byte(s), 0644)
}
