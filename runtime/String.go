package main

import (
	"math"
	"strconv"
)

// HxStringNull is the Haxe null string representation.
// It is a constant so that it can be safely used during the Go initialization process.
// Its value is "null" with a null character prefix, which displays correctly because the null character is ignored.
// This unusual value is used to represent the Haxe null string in Go, as Go does not have a direct equivalent for Haxe's null string.
const HxStringNull = "\u0000null"

func isStringNull(s string) bool {
	return s == HxStringNull
}

func HxNullableString(s string) HxNullable[string] {
	return HxNullable[string]{Value: s, Valid: !isStringNull(s)}
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

func HxStringConcat(a string, b string) string {
	if isStringNull(a) {
		a = "null"
	}
	if isStringNull(b) {
		b = "null"
	}
	return a + b
}

func HxFloatToString(f float64) string {
	switch {
	case math.IsNaN(f):
		return "NaN"
	case math.IsInf(f, 1):
		return "Infinity"
	case math.IsInf(f, -1):
		return "-Infinity"
	}

	abs := math.Abs(f)
	if abs == 0 || (abs >= 1e-4 && abs < 1e15) {
		return strconv.FormatFloat(f, 'f', -1, 64)
	}
	return strconv.FormatFloat(f, 'g', -1, 64)
}
