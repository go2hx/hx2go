package main

import (
	"fmt"
	"reflect"
	"strings"
)

type HxArrayDyn interface {
	Set_Dyn(idx int32, val any)
	Get_Dyn(idx int32) any
	Underlying_Dyn() []any
	ElemType() reflect.Type
	Len() int32
	String() string
}

type HxArray[T any] interface {
	HxArrayDyn
	Set(idx int32, val T)
	Get(idx int32) T
	Underlying() []T
}

type HxArrayImpl[T any] struct {
	data []T
}

func HxMakeArray[T any](items ...T) HxArray[T] {
	local := make([]T, len(items))
	copy(local, items)
	return HxArrayImpl[T]{local}
}

func (this HxArrayImpl[T]) ElemType() reflect.Type {
	return reflect.TypeOf((*T)(nil)).Elem()
}

func (this HxArrayView[T]) ElemType() reflect.Type {
	return reflect.TypeOf((*T)(nil)).Elem()
}

func (this HxArrayImpl[T]) Set_Dyn(idx int32, val any) {
	if obj, ok := val.(T); ok {
		this.data[idx] = obj
		return
	}
	this.data[idx] = Default[T]()
}

func (this HxArrayImpl[T]) Get_Dyn(idx int32) any {
	return this.data[idx]
}

func (this HxArrayImpl[T]) Underlying_Dyn() []any {
	out := make([]any, this.Len())
	for i := 0; i < int(this.Len()); i++ {
		out[i] = this.Get(int32(i))
	}

	return out
}

func (this HxArrayImpl[T]) Set(idx int32, val T) {
	this.data[idx] = val
}

func (this HxArrayImpl[T]) Get(idx int32) T {
	return this.data[idx]
}

func (this HxArrayImpl[T]) Underlying() []T {
	return this.data
}

func (this HxArrayView[T]) Underlying() []T {
	out := make([]T, this.Len())
	for i := 0; i < int(this.Len()); i++ {
		out[i] = this.Get(int32(i))
	}

	return out
}

func (this HxArrayImpl[T]) Len() int32 {
	return int32(len(this.data))
}

func (this HxArrayImpl[T]) String() string {
	var r strings.Builder
	r.WriteString("[")

	for i := 0; i < int(this.Len()); i++ {
		if i > 0 {
			r.WriteString(",")
		}

		r.WriteString(fmt.Sprintf("%v", this.Get(int32(i))))
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

func (this HxArrayView[T]) Set_Dyn(idx int32, val any) {
	(this.source).Set_Dyn(idx, val)
}

func (this HxArrayView[T]) Get_Dyn(idx int32) any {
	return (this.source).Get_Dyn(idx)
}

func (this HxArrayView[T]) Underlying_Dyn() []any {
	return (this.source).Underlying_Dyn()
}

func (this HxArrayView[T]) Set(idx int32, val T) {
	(this.source).Set_Dyn(idx, val)
}

func (this HxArrayView[T]) Get(idx int32) T {
	r_Dyn := (this.source).Get_Dyn(idx)
	r, _ := r_Dyn.(T)
	return r
}

func (this HxArrayView[T]) Len() int32 {
	return this.source.Len()
}

func (this HxArrayView[T]) String() string {
	return this.source.String()
}
