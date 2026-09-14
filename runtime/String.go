package main

// HxStringNull is the Haxe null string representation.
// It is a constant so that it can be safely used during the Go initialization process.
// Its value is "null" with a null character prefix, which displays correctly because the null character is ignored.
// This unusual value is used to represent the Haxe null string in Go, as Go does not have a direct equivalent for Haxe's null string.
const HxStringNull = "\u0000null"

func isStringNull(s string) bool {
	return s == HxStringNull
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
