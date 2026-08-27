package main

import (
	"fmt"
	"strings"
)

type ArrayAsDyn interface {
	Set_Dyn(idx int, val any)
	Get_Dyn(idx int) any
	Len() int
	String() string
}

type Array[T any] interface {
	ArrayAsDyn
	Set(idx int, val T)
	Get(idx int) T
}

type ArrayImpl[T any] struct {
	data []T
}

func MakeArray[T any](items ...T) Array[T] {
	local := make([]T, len(items))
	copy(local, items)
	return ArrayImpl[T]{local}
}

func (this ArrayImpl[T]) Set_Dyn(idx int, val any) {
	if obj, ok := val.(T); ok {
		this.data[idx] = obj
		return
	}
	this.data[idx] = Default[T]()
}

func (this ArrayImpl[T]) Get_Dyn(idx int) any {
	return this.data[idx]
}

func (this ArrayImpl[T]) Set(idx int, val T) {
	this.data[idx] = val
}

func (this ArrayImpl[T]) Get(idx int) T {
	return this.data[idx]
}

func (this ArrayImpl[T]) Len() int {
	return len(this.data)
}

func (this ArrayImpl[T]) String() string {
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

type ArrayView[T any] struct {
	source ArrayAsDyn
}

func MakeArrayView[T any](src ArrayAsDyn) Array[T] {
	return ArrayView[T]{src}
}

func (this ArrayView[T]) Set_Dyn(idx int, val any) {
	(this.source).Set_Dyn(idx, val)
}

func (this ArrayView[T]) Get_Dyn(idx int) any {
	return (this.source).Get_Dyn(idx)
}

func (this ArrayView[T]) Set(idx int, val T) {
	(this.source).Set_Dyn(idx, val)
}

func (this ArrayView[T]) Get(idx int) T {
	r_Dyn := (this.source).Get_Dyn(idx)
	r, _ := r_Dyn.(T)
	return r
}

func (this ArrayView[T]) Len() int {
	return this.source.Len()
}

func (this ArrayView[T]) String() string {
	return this.source.String()
}
