package main

import (
	"encoding/json"
	"fmt"
	"log"
	"os"
	"regexp"
	"sort"
	"strings"

	"golang.org/x/net/idna"
)

const (
	filename = "tlds-alpha-by-domain.txt"
)

var (
	punycodeRE = regexp.MustCompile(`(?i)xn--[a-z0-9]+`)
	puny       = idna.New()
)

func main() {
	content, err := os.ReadFile(filename)
	if err != nil {
		log.Fatal(err)
	}

	tldsRaw := strings.Split(string(content), "\n")
	tldsRaw = tldsRaw[1 : len(tldsRaw)-1]

	tldsRaw = mapper(tldsRaw, func(s string) string {
		s = strings.ToLower(s)

		if isPunyCode(s) {
			s, err = puny.ToUnicode(s)
			if err != nil {
				log.Fatal(err)
			}
		}

		return s
	})

	sort.Strings(tldsRaw)

	b, err := json.Marshal(tldsRaw)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println(string(b))
}

func mapper(vs []string, f func(string) string) []string {
	vsm := make([]string, len(vs))

	for i, v := range vs {
		vsm[i] = f(v)
	}

	return vsm
}

func isPunyCode(str string) bool {
	return punycodeRE.MatchString(str)
}
