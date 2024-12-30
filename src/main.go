package main

import (
    "C"
    "time"
    )

// One day in seconds
const oneDay = 86400

//export sum
func sum(a C.int, b C.int) C.int {
	return a + b
}

//export yesterday
func yesterday(c C.int) C.int {
    return c - C.int(oneDay)
}

//export current
func current() C.int {
    now := time.Now()
    converted := int(now.Unix())
    return C.int(converted)
}

//export enforce_binding
func enforce_binding() {}

func main() {}
