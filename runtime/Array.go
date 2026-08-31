package main

import (
	"reflect"
	"slices"
	"strings"
)

type HxArrayDyn interface {
	Set_Dyn(idx int32, val any)
	Get_Dyn(idx int32) any
	FastSet_Dyn(idx int32, val any)
	FastGet_Dyn(idx int32) any
	Pop_Dyn() any
	Shift_Dyn() any
	Insert_Dyn(idx int32, val any)
	Unshift_Dyn(val any)
	Remove_Dyn(val any) bool
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
	FastSet(idx int32, val T)
	FastGet(idx int32) T
	Unshift(val T) T
	Remove(val T) bool
	Insert(idx int32, val T)
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

func (this *HxArrayImpl[T]) FastSet(idx int32, val T) {
	this.data[idx] = val
}

func (this *HxArrayImpl[T]) FastGet(idx int32) T {
	return this.data[idx]
}

func (this *HxArrayImpl[T]) FastSet_Dyn(idx int32, val any) {
	this.data[idx] = HxConvert[T](val)
}

func (this *HxArrayImpl[T]) FastGet_Dyn(idx int32) any {
	return this.data[idx]
}

func (this HxArrayView[T]) FastSet_Dyn(idx int32, val any) {
	this.source.FastSet_Dyn(idx, val)
}

func (this HxArrayView[T]) FastGet_Dyn(idx int32) any {
	return this.source.FastGet_Dyn(idx)
}

func (this HxArrayView[T]) FastSet(idx int32, val T) {
	this.source.FastSet_Dyn(idx, val)
}

func (this HxArrayView[T]) FastGet(idx int32) T {
	r_dyn := this.source.FastGet_Dyn(idx)
	return HxConvert[T](r_dyn)
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

func (this HxArrayImpl[T]) String() string {
	var r strings.Builder
	r.WriteString("[")

	for i := 0; i < int(this.Len()); i++ {
		if i > 0 {
			r.WriteString(",")
		}

		r.WriteString(HxString(this.Get(int32(i))))
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

func (this *HxArrayImpl[T]) Unshift(val T) T {
	this.data = append([]T{val}, this.data...)
	return val
}

func (this *HxArrayImpl[T]) Unshift_Dyn(val any) {
	this.Unshift(HxConvert[T](val))
}

func (this HxArrayView[T]) Unshift(val T) T {
	this.source.Unshift_Dyn(val)
	return val
}

func (this HxArrayView[T]) Unshift_Dyn(val any) {
	this.source.Unshift_Dyn(val)
}

func (this *HxArrayImpl[T]) Remove(val T) bool {
	for i := int32(0); i < this.Len(); i++ {
		if reflect.DeepEqual(this.data[i], val) {
			this.data = append(this.data[:i], this.data[i+1:]...)
			return true
		}
	}

	return false
}

func (this *HxArrayImpl[T]) Remove_Dyn(val any) bool {
	return this.Remove(HxConvert[T](val))
}

func (this HxArrayView[T]) Remove(val T) bool {
	return this.source.Remove_Dyn(val)
}

func (this HxArrayView[T]) Remove_Dyn(val any) bool {
	return this.source.Remove_Dyn(val)
}

func (this *HxArrayImpl[T]) Insert(idx int32, val T) {
	if idx < 0 {
		idx = this.Len() + idx
		if idx < 0 {
			idx = 0
		}
	} else if idx > this.Len() {
		idx = this.Len()
	}

	this.data = append(this.data[:idx], append([]T{val}, this.data[idx:]...)...)
}

func (this *HxArrayImpl[T]) Insert_Dyn(idx int32, val any) {
	this.Insert(idx, HxConvert[T](val))
}

func (this HxArrayView[T]) Insert(idx int32, val T) {
	this.source.Insert_Dyn(idx, val)
}

func (this HxArrayView[T]) Insert_Dyn(idx int32, val any) {
	this.source.Insert_Dyn(idx, val)
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

		sb.WriteString(HxString(this.Get(i)))
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

func Hx_Array_Unshift[T any](this HxArray[T], val T) T {
	return this.Unshift(val)
}

func Hx_Array_Remove[T any](this HxArray[T], val T) bool {
	return this.Remove(val)
}

func Hx_Array_Insert[T any](this HxArray[T], idx int32, val T) {
	this.Insert(idx, val)
}

func Hx_Array_Slice[T any](this HxArray[T], pos int32, end HxNullable[int32]) HxArray[T] {
	length := this.Len()

	if pos < 0 {
		pos = length + pos
		if pos < 0 {
			pos = 0
		}
	}

	e := length
	if end.Valid {
		e = end.Value
		if e < 0 {
			e = length + e
			if e < 0 {
				e = 0
			}
		} else if e > length {
			e = length
		}
	}

	if pos > length || e <= pos {
		return HxMakeArray[T]()
	}

	if arr, ok := this.(*HxArrayImpl[T]); ok {
		out := make([]T, e-pos)
		copy(out, arr.data[pos:e])
		return &HxArrayImpl[T]{out}
	}

	out := HxMakeArray[T]()
	for i := pos; i < e; i++ {
		out.Set(out.Len(), this.Get(i))
	}

	return out
}

func Hx_Array_Splice[T any](this HxArray[T], pos int32, count int32) HxArray[T] {
	length := this.Len()

	if count < 0 {
		return HxMakeArray[T]()
	}

	if pos < 0 {
		pos = length + pos
		if pos < 0 {
			pos = 0
		}
	}

	if pos > length {
		pos = length
		count = 0
	} else if pos+count > length {
		count = length - pos
	}

	if arr, ok := this.(*HxArrayImpl[T]); ok {
		removed := make([]T, count)
		copy(removed, arr.data[pos:pos+count])
		arr.data = append(arr.data[:pos], arr.data[pos+count:]...)
		return &HxArrayImpl[T]{removed}
	}

	removed := HxMakeArray[T]()
	for i := int32(0); i < count; i++ {
		removed.Set(i, this.Get(pos+i))
	}

	for i := pos + count; i < length; i++ {
		this.Set(i-count, this.Get(i))
	}

	Hx_Array_Resize[T](this, length-count)

	return removed
}

func Hx_Array_IndexOf[T any](this HxArray[T], x T, fromIndex HxNullable[int32]) int32 {
	length := this.Len()
	start := int32(0)

	if fromIndex.Valid {
		start = fromIndex.Value
		if start < 0 {
			start = length + start
			if start < 0 {
				start = 0
			}
		}
	}

	if start >= length {
		return -1
	}

	if arr, ok := this.(*HxArrayImpl[T]); ok {
		for i := start; i < length; i++ {
			if reflect.DeepEqual(arr.data[i], x) {
				return i
			}
		}
		return -1
	}

	for i := start; i < length; i++ {
		if reflect.DeepEqual(this.Get(i), x) {
			return i
		}
	}

	return -1
}

func Hx_Array_LastIndexOf[T any](this HxArray[T], x T, fromIndex HxNullable[int32]) int32 {
	length := this.Len()
	start := length - 1

	if fromIndex.Valid {
		start = fromIndex.Value
		if start < 0 {
			start = length + start
			if start < 0 {
				return -1
			}
		} else if start >= length {
			start = length - 1
		}
	}

	if arr, ok := this.(*HxArrayImpl[T]); ok {
		for i := start; i >= 0; i-- {
			if reflect.DeepEqual(arr.data[i], x) {
				return i
			}
		}
		return -1
	}

	for i := start; i >= 0; i-- {
		if reflect.DeepEqual(this.Get(i), x) {
			return i
		}
	}

	return -1
}

// TODO: KV-iterator and V-iterator
