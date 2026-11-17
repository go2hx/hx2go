package main

import "reflect"

type hxEnumValue interface {
	Hx_Field_enumIndex() int32
}

func HxEnumEqFast(a any, b any) int32 {
	if _, ok := a.(hxEnumValue); !ok {
		return -1
	}
	if _, ok := b.(hxEnumValue); !ok {
		return -1
	}

	ta := reflect.TypeOf(a)
	if ta != reflect.TypeOf(b) {
		return 0
	}
	if ta.Kind() == reflect.Struct && ta.NumField() == 0 {
		return 1
	}

	return -1
}
