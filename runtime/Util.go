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

	var t T
	tt := reflect.TypeOf(t)
	targetNullable := Hx_Field_go_haxe_hxdynamic_isNullableType(tt)

	var fv reflect.Value
	if from != nil {
		fv = reflect.ValueOf(from)
		if Hx_Field_go_haxe_hxdynamic_isNullableType(fv.Type()) {
			if !fv.Field(1).Bool() {
				from = nil
			} else {
				from = fv.Field(0).Interface()
				fv = reflect.ValueOf(from)
			}
		}
	}

	if targetNullable {
		box := reflect.New(tt).Elem()
		if from != nil {
			ft := tt.Field(0).Type
			if fv.Type().ConvertibleTo(ft) {
				box.Field(0).Set(fv.Convert(ft))
				box.Field(1).SetBool(true)
			}
		}

		return box.Interface().(T)
	}

	if from == nil {
		return HxDefault[T]()
	}

	if fv.Type().ConvertibleTo(tt) {
		return fv.Convert(tt).Interface().(T)
	}

	return HxDefault[T]()
}

func HxString[T any](val T) string {
	return Hx_Field_std_string(val)
}

type HxNullable[T any] = struct {
	Value T
	Valid bool
}
