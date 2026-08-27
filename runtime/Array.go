package main

import (
	"fmt"
	"strings"
)

type HxArrayDyn interface {
	Set_Dyn(idx int, val any)
	Get_Dyn(idx int) any
	Len() int
	String() string
}

type HxArray[T any] interface {
	HxArrayDyn
	Set(idx int, val T)
	Get(idx int) T
}

type HxArrayImpl[T any] struct {
	data []T
}

func HxMakeArray[T any](items ...T) HxArray[T] {
	local := make([]T, len(items))
	copy(local, items)
	return HxArrayImpl[T]{local}
}

func (this HxArrayImpl[T]) Set_Dyn(idx int, val any) {
	if obj, ok := val.(T); ok {
		this.data[idx] = obj
		return
	}
	this.data[idx] = Default[T]()
}

func (this HxArrayImpl[T]) Get_Dyn(idx int) any {
	return this.data[idx]
}

func (this HxArrayImpl[T]) Set(idx int, val T) {
	this.data[idx] = val
}

func (this HxArrayImpl[T]) Get(idx int) T {
	return this.data[idx]
}

func (this HxArrayImpl[T]) Len() int {
	return len(this.data)
}

func (this HxArrayImpl[T]) String() string {
	var r strings.Builder
	r.WriteString("[")

	for i := 0; i < this.Len(); i++ {
		if i > 0 {
			r.WriteString(",")
		}

		r.WriteString(fmt.Sprintf("%v", this.Get(i)))
	}

	r.WriteString("]")
	return r.String()
}

type HxArrayView[T any] struct {
	source HxArrayDyn
}

func HxMakeArrayView[T any](src HxArrayDyn) HxArray[T] {
	return HxArrayView[T]{src}
}

func (this HxArrayView[T]) Set_Dyn(idx int, val any) {
	(this.source).Set_Dyn(idx, val)
}

func (this HxArrayView[T]) Get_Dyn(idx int) any {
	return (this.source).Get_Dyn(idx)
}

func (this HxArrayView[T]) Set(idx int, val T) {
	(this.source).Set_Dyn(idx, val)
}

func (this HxArrayView[T]) Get(idx int) T {
	r_Dyn := (this.source).Get_Dyn(idx)
	r, _ := r_Dyn.(T)
	return r
}

func (this HxArrayView[T]) Len() int {
	return this.source.Len()
}

func (this HxArrayView[T]) String() string {
	return this.source.String()
}
