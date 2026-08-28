package main

import (
	"fmt"
	"reflect"
	"slices"
	"strings"
)

type HxArrayDyn interface {
	Set_Dyn(idx int32, val any)
	Get_Dyn(idx int32) any
	Pop_Dyn() any
	Shift_Dyn() any
	Underlying_Dyn() []any
	ElemType() reflect.Type
	Grow(elements int32)
	Len() int32
	String() string
}

type HxArray[T any] interface {
	HxArrayDyn
	Set(idx int32, val T)
	Get(idx int32) T
	Pop() HxNullable[T]
	Shift() HxNullable[T]
	Dyn() HxArray[any]
	Underlying() []T
}

type HxArrayImpl[T any] struct {
	data []T
}

func HxMakeArray[T any](items ...T) HxArray[T] {
	local := make([]T, len(items))
	copy(local, items)
	return &HxArrayImpl[T]{local}
}

func (this *HxArrayImpl[T]) Grow(elements int32) {
	oldLen := int32(len(this.data))
	oldCap := int32(cap(this.data))
	newLen := oldLen + elements

	if newLen > oldCap {
		newCap := oldCap
		if newCap == 0 {
			newCap = newLen
		}

		for newCap < newLen {
			newCap *= 2
		}

		data := make([]T, newLen, newCap)
		copy(data, this.data)
		this.data = data
	} else {
		this.data = this.data[:newLen]
	}
}

func (this HxArrayView[T]) Grow(elements int32) {
	this.source.Grow(elements)
}

func (this *HxArrayImpl[T]) Dyn() HxArray[any] {
	return HxMakeArrayView[any](this)
}

func (this HxArrayView[T]) Dyn() HxArray[any] {
	return HxMakeArrayView[any](this.source)
}

func (this *HxArrayImpl[T]) ElemType() reflect.Type {
	return reflect.TypeOf((*T)(nil)).Elem()
}

func (this HxArrayView[T]) ElemType() reflect.Type {
	return this.source.ElemType()
}

func (this *HxArrayImpl[T]) Set_Dyn(idx int32, val any) {
	length := int32(len(this.data))

	if idx < 0 {
		panic("Array index out of bounds")
	}

	if idx >= length {
		this.Grow(idx - length + 1)
	}

	this.data[idx] = HxConvert[T](val)
}

func (this *HxArrayImpl[T]) Get_Dyn(idx int32) any {
	length := int32(len(this.data))

	if idx < 0 {
		panic("Array index out of bounds")
	}

	if idx >= length {
		return HxDefault[T]()
	}

	return this.data[idx]
}

func (this *HxArrayImpl[T]) Underlying_Dyn() []any {
	out := make([]any, this.Len())
	for i := 0; i < int(this.Len()); i++ {
		out[i] = this.Get(int32(i))
	}

	return out
}

func (this *HxArrayImpl[T]) Set(idx int32, val T) {
	length := int32(len(this.data))

	if idx < 0 {
		panic("Array index out of bounds")
	}

	if idx >= length {
		this.Grow(idx - length + 1)
	}

	this.data[idx] = val
}

func (this *HxArrayImpl[T]) Get(idx int32) T {
	length := int32(len(this.data))

	if idx < 0 {
		panic("Array index out of bounds")
	}

	if idx >= length {
		return HxDefault[T]()
	}

	return this.data[idx]
}

func (this *HxArrayImpl[T]) Underlying() []T {
	return this.data
}

func (this HxArrayView[T]) Underlying() []T {
	out := make([]T, this.Len())
	for i := 0; i < int(this.Len()); i++ {
		out[i] = this.Get(int32(i))
	}

	return out
}

func (this *HxArrayImpl[T]) Len() int32 {
	return int32(len(this.data))
}

func (this *HxArrayImpl[T]) String() string {
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
	this.source.Set_Dyn(idx, val)
}

func (this HxArrayView[T]) Get_Dyn(idx int32) any {
	return this.source.Get_Dyn(idx)
}

func (this HxArrayView[T]) Underlying_Dyn() []any {
	return this.source.Underlying_Dyn()
}

func (this HxArrayView[T]) Set(idx int32, val T) {
	this.source.Set_Dyn(idx, val)
}

func (this HxArrayView[T]) Get(idx int32) T {
	r_dyn := this.source.Get_Dyn(idx)
	return HxConvert[T](r_dyn)
}

func (this HxArrayView[T]) Len() int32 {
	return this.source.Len()
}

func (this HxArrayView[T]) String() string {
	return this.source.String()
}

func Hx_Array_Push[T any](this HxArray[T], val T) int32 {
	this.Set(this.Len(), val)
	return this.Len()
}

func Hx_Array_Concat[T any](this HxArray[T], arr HxArray[T]) HxArray[T] {
	data := make([]T, 0)
	data = append(data, this.Underlying()...)
	data = append(data, arr.Underlying()...)

	return HxMakeArray[T](data...)
}

func Hx_Array_Copy[T any](this HxArray[T]) HxArray[T] {
	return HxMakeArray[T](this.Underlying()...)
}

func (this *HxArrayImpl[T]) Pop() HxNullable[T] {
	length := int32(len(this.data))

	if length == 0 {
		return HxNullable[T]{}
	}

	item := this.data[length-1]
	this.data = this.data[:length-1]

	return HxNullable[T]{Value: item, Valid: true}
}

func (this *HxArrayImpl[T]) Pop_Dyn() any {
	length := this.Len()

	if length == 0 {
		return nil
	}

	item := this.data[length-1]
	this.data = this.data[:length-1]

	return item
}

func (this HxArrayView[T]) Pop_Dyn() any {
	return this.source.Pop_Dyn()
}

func (this HxArrayView[T]) Pop() HxNullable[T] {
	value := this.source.Pop_Dyn()
	return HxNullable[T]{Value: HxConvert[T](value), Valid: value != nil}
}

func (this *HxArrayImpl[T]) Shift() HxNullable[T] {
	length := int32(len(this.data))

	if length == 0 {
		return HxNullable[T]{}
	}

	item := this.data[0]
	this.data = this.data[1:]

	return HxNullable[T]{Value: item, Valid: true}
}

func (this *HxArrayImpl[T]) Shift_Dyn() any {
	length := this.Len()

	if length == 0 {
		return nil
	}

	item := this.data[0]
	this.data = this.data[1:]

	return item
}

func (this HxArrayView[T]) Shift_Dyn() any {
	return this.source.Shift_Dyn()
}

func (this HxArrayView[T]) Shift() HxNullable[T] {
	value := this.source.Shift_Dyn()
	return HxNullable[T]{Value: HxConvert[T](value), Valid: value != nil}
}

func Hx_Array_Pop[T any](this HxArray[T]) HxNullable[T] {
	return this.Pop()
}

func Hx_Array_Map[T any, S any](this HxArray[T], f func(T) S) HxArray[S] {
	out := HxMakeArray[S]()

	for i := int32(0); i < this.Len(); i++ {
		out.Set(i, f(this.Get(i)))
	}

	return out
}

func Hx_Array_Reverse[T any](this HxArray[T]) {
	for i := int32(0); i < this.Len()/2; i++ {
		j := this.Len() - 1 - i
		temp := this.Get(i)
		this.Set(i, this.Get(j))
		this.Set(j, temp)
	}
}

func Hx_Array_Shift[T any](this HxArray[T]) HxNullable[T] {
	return this.Shift()
}

func Hx_Array_ToString[T any](this HxArray[T]) string {
	return this.String()
}

func Hx_Array_Contains[T any](this HxArray[T], value T) bool {
	for i := int32(0); i < this.Len(); i++ {
		if reflect.DeepEqual(this.Get(i), value) {
			return true
		}
	}

	return false
}

func Hx_Array_Filter[T any](this HxArray[T], f func(T) bool) HxArray[T] {
	out := HxMakeArray[T]()

	for i := int32(0); i < this.Len(); i++ {
		item := this.Get(i)

		if f(item) {
			out.Set(out.Len(), item)
		}
	}

	return out
}

func Hx_Array_Resize[T any](this HxArray[T], size int32) {
	this.Grow(size - this.Len())
}

func Hx_Array_Join[T any](this HxArray[T], sep string) string {
	var sb strings.Builder

	for i := int32(0); i < this.Len(); i++ {
		if i > 0 {
			sb.WriteString(sep)
		}

		sb.WriteString(fmt.Sprintf("%v", this.Get(i)))
	}

	return sb.String()
}

func Hx_Array_Sort[T any](this HxArray[T], f func(a T, b T) int32) {
	switch arr := this.(type) {
	case *HxArrayImpl[T]: // optimised path
		slices.SortFunc(arr.data, func(a T, b T) int {
			return int(f(a, b))
		})

	default: // slow(er) fallback for array views where we cannot directly access data
		for i := int32(0); i < this.Len(); i++ {
			for j := i + 1; j < this.Len(); j++ {
				if f(this.Get(i), this.Get(j)) > 0 {
					temp := this.Get(i)
					this.Set(i, this.Get(j))
					this.Set(j, temp)
				}
			}
		}
	}
}
