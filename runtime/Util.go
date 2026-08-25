package main

func HxDefault[T any]() T {
	var v T
	return v
}

type HxNullable[T any] struct {
	Value T
	Valid bool
}
