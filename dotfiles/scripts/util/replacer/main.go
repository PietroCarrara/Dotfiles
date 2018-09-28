//
// main.go
// Copyright (C) 2018 pietro <pietro@the-arch>
//
// Distributed under terms of the MIT license.
//

package main

import (
	"github.com/cbroglie/mustache"
	"io/ioutil"
	"os"
	"path/filepath"
	"strings"
)

func main() {

	args := map[string]string{}

	for _, str := range os.Args[2:] {
		val := strings.Split(str, "=")

		args[val[0]] = strings.Join(val[1:], "")
	}

	res, _ := mustache.RenderFile(os.Args[1], args)

	basename := os.Args[1]
	filename := strings.TrimSuffix(basename, filepath.Ext(basename))

	ioutil.WriteFile(filename, []byte(res), 0644)
}
