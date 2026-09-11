package main

import (
	"strings"
	"unsafe"
)

var ASCIInullStr = "\u0000"
var HxStringNull, _ = strings.CutSuffix(ASCIInullStr+"null"+ASCIInullStr, ASCIInullStr)

func isStringNull(s string) bool {
	if len(s) != len(HxStringNull) {
		return false
	}
	return unsafe.StringData(s) == unsafe.StringData(HxStringNull)
}

func HxStringCompare(a string, b string) bool {
	if a == b {
		ua := isStringNull(a)
		ub := isStringNull(b)
		if ua || ub {
			return ua && ub
		}
		return true
	} else {
		return false
	}
}
