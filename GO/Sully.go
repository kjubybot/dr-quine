package main

import (
	"fmt"
	"io/ioutil"
	"os/exec"
	"path"
	"runtime"
)

func main() {
	i := 5
	if i == 0 {
		return
	}
	_, filename, _, _ := runtime.Caller(0)
	if path.Base(filename) != "Sully.go" {
		i--
	}
	s := fmt.Sprintf("Sully_%d.go", i)
	v := `package main

import (
	"fmt"
	"io/ioutil"
	"os/exec"
	"path"
	"runtime"
)

func main() {
	i := %d
	if i == 0 {
		return
	}
	_, filename, _, _ := runtime.Caller(0)
	if path.Base(filename) != "Sully.go" {
		i--
	}
	s := fmt.Sprintf("Sully_%%d.go", i)
	v := %c%s%c
	v = fmt.Sprintf(v, i, 96, v, 96)
	ioutil.WriteFile(s, []byte(v), 0644)
	exec.Command("go", "build", s).Run()
	s = fmt.Sprintf("Sully_%%d", i)
	exec.Command("./" + s).Run()
}
`
	v = fmt.Sprintf(v, i, 96, v, 96)
	ioutil.WriteFile(s, []byte(v), 0644)
	exec.Command("go", "build", s).Run()
	s = fmt.Sprintf("Sully_%d", i)
	exec.Command("./" + s).Run()
}
