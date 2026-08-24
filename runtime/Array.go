package main

import (
	"fmt"
	"reflect"
)

type HxDynamicArray interface {
	Len() int32
	ElemType() reflect.Type
	Set_Dyn(idx int32, val any)
	Get_Dyn(idx int32) any
	Slice_Dyn() []any
}

type HxArray[T any] interface {
	Len() int32
	ElemType() reflect.Type
	Slice() []T
	Set(idx int32, val T)
	Get(idx int32) T
	Dyn() HxDynamicArray
}

type HxArrayImpl[T any] struct {
	data []T
}

type HxArrayView[T any] struct {
	source *HxArrayImpl[any]
}

func HxMakeArray[T any](items ...T) HxArray[T] {
	local := make([]T, len(items))
	copy(local, items)

	return &HxArrayImpl[T]{local}
}

func HxDynamicArrayAs[T any](arr HxDynamicArray) HxArray[T] {
	if obj, ok := arr.(*HxArrayImpl[T]); ok {
		return obj
	}

	if obj, ok := arr.(*HxArrayImpl[any]); ok {
		return &HxArrayView[T]{source: obj}
	}

	panic("cannot cast dynamic array to concrete array")
}

func (this *HxArrayImpl[T]) Dyn() HxDynamicArray {
	return this
}

func (this *HxArrayView[T]) Dyn() HxDynamicArray {
	return this.source
}

func (this *HxArrayImpl[T]) ElemType() reflect.Type {
	return reflect.TypeOf((*T)(nil)).Elem()
}

func (this *HxArrayView[T]) ElemType() reflect.Type {
	return reflect.TypeOf((*T)(nil)).Elem()
}

func (this *HxArrayImpl[T]) Set_Dyn(idx int32, val any) {
	if obj, ok := val.(T); ok {
		this.data[idx] = obj
		return
	}

	this.data[idx] = Hx_Field_go_haxe_hxdynamic_ensureInterface(Hx_Field_go_haxe_hxdynamic_valueToAssign(val, this.ElemType())).(T)
}

func (this *HxArrayImpl[T]) Get_Dyn(idx int32) any {
	return this.data[idx]
}

func (this *HxArrayImpl[T]) Slice_Dyn() []any {
	src := this.data
	out := make([]any, len(src))
	for i, v := range src {
		out[i] = v
	}

	return out
}

func (this *HxArrayImpl[T]) Len() int32 {
	return int32(len(this.data))
}

func (this *HxArrayView[T]) Len() int32 {
	return this.source.Len()
}

func (this *HxArrayImpl[T]) Set(idx int32, val T) {
	if idx < 0 {
		panic("array index out of bounds")
	}

	if int(idx) >= len(this.data) {
		this.data = append(this.data, make([]T, int(idx)+1-len(this.data))...)
	}

	this.data[idx] = val
}

func (this *HxArrayView[T]) Set(idx int32, val T) {
	this.source.Set(idx, val)
}

func (this *HxArrayImpl[T]) Get(idx int32) T {
	if idx < 0 || int(idx) >= len(this.data) {
		return HxDefault[T]()
	}

	return this.data[idx]
}

func (this *HxArrayView[T]) Get(idx int32) T {
	v := this.source.Get(idx)
	if obj, ok := v.(T); ok {
		return obj
	}

	return HxDefault[T]()
}

func (this *HxArrayImpl[T]) Slice() []T {
	src := this.data
	out := make([]T, len(src))
	copy(out, src)

	return out
}

func (this *HxArrayView[T]) Slice() []T {
	src := this.source.data
	out := make([]T, len(src))
	for i, v := range src {
		out[i] = v.(T)
	}

	return out
}

func (this *HxArrayImpl[T]) String() string {
	return fmt.Sprint(this.data)
}

func (this *HxArrayView[T]) String() string {
	return fmt.Sprint(this.source.data)
}
