package main

import "reflect"

func HxDefault[T any]() T {
	var v T
	return v
}

func HxConvert[T any](from any) T {
	if r, ok := from.(T); ok {
		return r
	}

	if from == nil {
		return HxDefault[T]()
	}

	var t T
	tt := reflect.TypeOf(t)
	fv := reflect.ValueOf(from)

	if fv.CanConvert(tt) {
		to := fv.Convert(tt)
		if rta, ok := reflect.TypeAssert[T](to); ok {
			return rta
		}
	}

	return HxDefault[T]()
}

type HxNullable[T any] = struct {
	Value T
	Valid bool
}
