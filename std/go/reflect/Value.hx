package go.reflect;

/**
    Value is the reflection interface to a Go value.
    
    Not all methods apply to all kinds of values. Restrictions,
    if any, are noted in the documentation for each method.
    Use the Kind method to find out the kind of value before
    calling kind-specific methods. Calling a method
    inappropriate to the kind of type causes a run time panic.
    
    The zero Value represents no value.
    Its [Value.IsValid] method returns false, its Kind method returns [Invalid],
    its String method returns "<invalid Value>", and all other methods panic.
    Most functions and methods never return an invalid value.
    If one does, its documentation states the conditions explicitly.
    
    A Value can be used concurrently by multiple goroutines provided that
    the underlying Go value can be used concurrently for the equivalent
    direct operations.
    
    To compare two Values, compare the results of the Interface method.
    Using == on two Values does not compare the underlying values
    they represent.
**/
@:structInit
@:go.Type({ name: "Value", instanceName: "reflect.Value", imports: ["reflect"] })
extern class Value {

    /**
        Addr returns a pointer value representing the address of v.
        It panics if [Value.CanAddr] returns false.
        Addr is typically used to obtain a pointer to a struct field
        or slice element in order to call a method that requires a
        pointer receiver.
    **/
    @:native("Addr") function addr(): (go.reflect.Value);
    /**
        Bool returns v's underlying value.
        It panics if v's kind is not [Bool].
    **/
    @:native("Bool") function bool(): (Bool);
    /**
        Bytes returns v's underlying value.
        It panics if v's underlying value is not a slice of bytes or
        an addressable array of bytes.
    **/
    @:native("Bytes") function bytes(): (go.Slice<go.Byte>);
    /**
        Call calls the function v with the input arguments in.
        For example, if len(in) == 3, v.Call(in) represents the Go call v(in[0], in[1], in[2]).
        Call panics if v's Kind is not [Func].
        It returns the output results as Values.
        As in Go, each input argument must be assignable to the
        type of the function's corresponding input parameter.
        If v is a variadic function, Call creates the variadic slice parameter
        itself, copying in the corresponding values.
        It panics if the Value was obtained by accessing unexported struct fields.
    **/
    @:native("Call") function call(_in: go.Slice<go.reflect.Value>): (go.Slice<go.reflect.Value>);
    /**
        CallSlice calls the variadic function v with the input arguments in,
        assigning the slice in[len(in)-1] to v's final variadic argument.
        For example, if len(in) == 3, v.CallSlice(in) represents the Go call v(in[0], in[1], in[2]...).
        CallSlice panics if v's Kind is not [Func] or if v is not variadic.
        It returns the output results as Values.
        As in Go, each input argument must be assignable to the
        type of the function's corresponding input parameter.
        It panics if the Value was obtained by accessing unexported struct fields.
    **/
    @:native("CallSlice") function callSlice(_in: go.Slice<go.reflect.Value>): (go.Slice<go.reflect.Value>);
    /**
        CanAddr reports whether the value's address can be obtained with [Value.Addr].
        Such values are called addressable. A value is addressable if it is
        an element of a slice, an element of an addressable array,
        a field of an addressable struct, or the result of dereferencing a pointer.
        If CanAddr returns false, calling [Value.Addr] will panic.
    **/
    @:native("CanAddr") function canAddr(): (Bool);
    /**
        CanComplex reports whether [Value.Complex] can be used without panicking.
    **/
    @:native("CanComplex") function canComplex(): (Bool);
    /**
        CanConvert reports whether the value v can be converted to type t.
        If v.CanConvert(t) returns true then v.Convert(t) will not panic.
    **/
    @:native("CanConvert") function canConvert(t: go.reflect.Type): (Bool);
    /**
        CanFloat reports whether [Value.Float] can be used without panicking.
    **/
    @:native("CanFloat") function canFloat(): (Bool);
    /**
        CanInt reports whether Int can be used without panicking.
    **/
    @:native("CanInt") function canInt(): (Bool);
    /**
        CanInterface reports whether [Value.Interface] can be used without panicking.
    **/
    @:native("CanInterface") function canInterface(): (Bool);
    /**
        CanSet reports whether the value of v can be changed.
        A [Value] can be changed only if it is addressable and was not
        obtained by the use of unexported struct fields.
        If CanSet returns false, calling [Value.Set] or any type-specific
        setter (e.g., [Value.SetBool], [Value.SetInt]) will panic.
    **/
    @:native("CanSet") function canSet(): (Bool);
    /**
        CanUint reports whether [Value.Uint] can be used without panicking.
    **/
    @:native("CanUint") function canUint(): (Bool);
    /**
        Cap returns v's capacity.
        It panics if v's Kind is not [Array], [Chan], [Slice] or pointer to [Array].
    **/
    @:native("Cap") function cap(): (go.GoInt);
    /**
        Clear clears the contents of a map or zeros the contents of a slice.
        
        It panics if v's Kind is not [Map] or [Slice].
    **/
    @:native("Clear") function clear(): Void;
    /**
        Close closes the channel v.
        It panics if v's Kind is not [Chan] or
        v is a receive-only channel.
    **/
    @:native("Close") function close(): Void;
    /**
        Comparable reports whether the value v is comparable.
        If the type of v is an interface, this checks the dynamic type.
        If this reports true then v.Interface() == x will not panic for any x,
        nor will v.Equal(u) for any Value u.
    **/
    @:native("Comparable") function comparable(): (Bool);
    /**
        Complex returns v's underlying value, as a complex128.
        It panics if v's Kind is not [Complex64] or [Complex128]
    **/
    @:native("Complex") function complex(): (go.Complex128);
    /**
        Convert returns the value v converted to type t.
        If the usual Go conversion rules do not allow conversion
        of the value v to type t, or if converting v to type t panics, Convert panics.
    **/
    @:native("Convert") function convert(t: go.reflect.Type): (go.reflect.Value);
    /**
        Elem returns the value that the interface v contains
        or that the pointer v points to.
        It panics if v's Kind is not [Interface] or [Pointer].
        It returns the zero Value if v is nil.
    **/
    @:native("Elem") function elem(): (go.reflect.Value);
    /**
        Equal reports true if v is equal to u.
        For two invalid values, Equal will report true.
        For an interface value, Equal will compare the value within the interface.
        Otherwise, If the values have different types, Equal will report false.
        Otherwise, for arrays and structs Equal will compare each element in order,
        and report false if it finds non-equal elements.
        During all comparisons, if values of the same type are compared,
        and the type is not comparable, Equal will panic.
    **/
    @:native("Equal") function equal(u: go.reflect.Value): (Bool);
    /**
        Field returns the i'th field of the struct v.
        It panics if v's Kind is not [Struct] or i is out of range.
    **/
    @:native("Field") function field(i: go.GoInt): (go.reflect.Value);
    /**
        FieldByIndex returns the nested field corresponding to index.
        It panics if evaluation requires stepping through a nil
        pointer or a field that is not a struct.
    **/
    @:native("FieldByIndex") function fieldByIndex(index: go.Slice<go.GoInt>): (go.reflect.Value);
    /**
        FieldByIndexErr returns the nested field corresponding to index.
        It returns an error if evaluation requires stepping through a nil
        pointer, but panics if it must step through a field that
        is not a struct.
    **/
    @:native("FieldByIndexErr") function fieldByIndexErr(index: go.Slice<go.GoInt>): (go.Result<go.reflect.Value>);
    /**
        FieldByName returns the struct field with the given name.
        It returns the zero Value if no field was found.
        It panics if v's Kind is not [Struct].
    **/
    @:native("FieldByName") function fieldByName(name: std.String): (go.reflect.Value);
    /**
        FieldByNameFunc returns the struct field with a name
        that satisfies the match function.
        It panics if v's Kind is not [Struct].
        It returns the zero Value if no field was found.
    **/
    @:native("FieldByNameFunc") function fieldByNameFunc(match: (p0: std.String) -> (Bool)): (go.reflect.Value);
    /**
        Fields returns an iterator over each [StructField] of v along with its [Value].
        
        The sequence is equivalent to calling [Value.Field] successively
        for each index i in the range [0, NumField()).
        
        It panics if v's Kind is not Struct.
    **/
    @:native("Fields") function fields(): (go.iter.Seq2<go.reflect.StructField, go.reflect.Value>);
    /**
        Float returns v's underlying value, as a float64.
        It panics if v's Kind is not [Float32] or [Float64]
    **/
    @:native("Float") function float(): (Float);
    /**
        Grow increases the slice's capacity, if necessary, to guarantee space for
        another n elements. After Grow(n), at least n elements can be appended
        to the slice without another allocation.
        
        It panics if v's Kind is not a [Slice], or if n is negative or too large to
        allocate the memory, or if [Value.CanSet] returns false.
    **/
    @:native("Grow") function grow(n: go.GoInt): Void;
    /**
        Index returns v's i'th element.
        It panics if v's Kind is not [Array], [Slice], or [String] or i is out of range.
    **/
    @:native("Index") function index(i: go.GoInt): (go.reflect.Value);
    /**
        Int returns v's underlying value, as an int64.
        It panics if v's Kind is not [Int], [Int8], [Int16], [Int32], or [Int64].
    **/
    @:native("Int") function int(): (go.Int64);
    /**
        Interface returns v's current value as an interface{}.
        It is equivalent to:
        
        	var i interface{} = (v's underlying value)
        
        It panics if the Value was obtained by accessing
        unexported struct fields.
    **/
    @:native("Interface") function _interface(): (Dynamic);
    /**
        InterfaceData returns a pair of unspecified uintptr values.
        It panics if v's Kind is not Interface.
        
        In earlier versions of Go, this function returned the interface's
        value as a uintptr pair. As of Go 1.4, the implementation of
        interface values precludes any defined use of InterfaceData.
        
        Deprecated: The memory representation of interface values is not
        compatible with InterfaceData.
    **/
    @:native("InterfaceData") function interfaceData(): (go.GoArray<go.UIntPtr, 2>);
    /**
        IsNil reports whether its argument v is nil. The argument must be
        a chan, func, interface, map, pointer, or slice value; if it is
        not, IsNil panics. Note that IsNil is not always equivalent to a
        regular comparison with nil in Go. For example, if v was created
        by calling [ValueOf] with an uninitialized interface variable i,
        i==nil will be true but v.IsNil will panic as v will be the zero
        Value.
    **/
    @:native("IsNil") function isNil(): (Bool);
    /**
        IsValid reports whether v represents a value.
        It returns false if v is the zero Value.
        If [Value.IsValid] returns false, all other methods except String panic.
        Most functions and methods never return an invalid Value.
        If one does, its documentation states the conditions explicitly.
    **/
    @:native("IsValid") function isValid(): (Bool);
    /**
        IsZero reports whether v is the zero value for its type.
        It panics if the argument is invalid.
    **/
    @:native("IsZero") function isZero(): (Bool);
    /**
        Kind returns v's Kind.
        If v is the zero Value ([Value.IsValid] returns false), Kind returns Invalid.
    **/
    @:native("Kind") function kind(): (go.reflect.Kind);
    /**
        Len returns v's length.
        It panics if v's Kind is not [Array], [Chan], [Map], [Slice], [String], or pointer to [Array].
    **/
    @:native("Len") function len(): (go.GoInt);
    /**
        MapIndex returns the value associated with key in the map v.
        It panics if v's Kind is not [Map].
        It returns the zero Value if key is not found in the map or if v represents a nil map.
        As in Go, the key's value must be assignable to the map's key type.
    **/
    @:native("MapIndex") function mapIndex(key: go.reflect.Value): (go.reflect.Value);
    /**
        MapKeys returns a slice containing all the keys present in the map,
        in unspecified order.
        It panics if v's Kind is not [Map].
        It returns an empty slice if v represents a nil map.
    **/
    @:native("MapKeys") function mapKeys(): (go.Slice<go.reflect.Value>);
    /**
        MapRange returns a range iterator for a map.
        It panics if v's Kind is not [Map].
        
        Call [MapIter.Next] to advance the iterator, and [MapIter.Key]/[MapIter.Value] to access each entry.
        [MapIter.Next] returns false when the iterator is exhausted.
        MapRange follows the same iteration semantics as a range statement.
        
        Example:
        
        	iter := reflect.ValueOf(m).MapRange()
        	for iter.Next() {
        		k := iter.Key()
        		v := iter.Value()
        		...
        	}
    **/
    @:native("MapRange") function mapRange(): (go.Pointer<go.reflect.MapIter>);
    /**
        Method returns a function value corresponding to v's i'th method.
        The arguments to a Call on the returned function should not include
        a receiver; the returned function will always use v as the receiver.
        Method panics if i is out of range or if v is a nil interface value.
        
        Calling this method will force the linker to retain all exported methods in all packages.
        This may make the executable binary larger but will not affect execution time.
    **/
    @:native("Method") function method(i: go.GoInt): (go.reflect.Value);
    /**
        MethodByName returns a function value corresponding to the method
        of v with the given name.
        The arguments to a Call on the returned function should not include
        a receiver; the returned function will always use v as the receiver.
        It returns the zero Value if no method was found.
        
        Calling this method will cause the linker to retain all methods with this name in all packages.
        If the linker can't determine the name, it will retain all exported methods.
        This may make the executable binary larger but will not affect execution time.
    **/
    @:native("MethodByName") function methodByName(name: std.String): (go.reflect.Value);
    /**
        Methods returns an iterator over each [Method] of v along with the corresponding
        method [Value]; this is a function with v bound as the receiver. As such, the
        receiver shouldn't be included in the arguments to [Value.Call].
        
        The sequence is equivalent to calling [Value.Method] successively
        for each index i in the range [0, NumMethod()).
        
        Methods panics if v is a nil interface value.
        
        Calling this method will force the linker to retain all exported methods in all packages.
        This may make the executable binary larger but will not affect execution time.
    **/
    @:native("Methods") function methods(): (go.iter.Seq2<go.reflect.Method, go.reflect.Value>);
    /**
        NumField returns the number of fields in the struct v.
        It panics if v's Kind is not [Struct].
    **/
    @:native("NumField") function numField(): (go.GoInt);
    /**
        NumMethod returns the number of methods in the value's method set.
        
        For a non-interface type, it returns the number of exported methods.
        
        For an interface type, it returns the number of exported and unexported methods.
    **/
    @:native("NumMethod") function numMethod(): (go.GoInt);
    /**
        OverflowComplex reports whether the complex128 x cannot be represented by v's type.
        It panics if v's Kind is not [Complex64] or [Complex128].
    **/
    @:native("OverflowComplex") function overflowComplex(x: go.Complex128): (Bool);
    /**
        OverflowFloat reports whether the float64 x cannot be represented by v's type.
        It panics if v's Kind is not [Float32] or [Float64].
    **/
    @:native("OverflowFloat") function overflowFloat(x: Float): (Bool);
    /**
        OverflowInt reports whether the int64 x cannot be represented by v's type.
        It panics if v's Kind is not [Int], [Int8], [Int16], [Int32], or [Int64].
    **/
    @:native("OverflowInt") function overflowInt(x: go.Int64): (Bool);
    /**
        OverflowUint reports whether the uint64 x cannot be represented by v's type.
        It panics if v's Kind is not [Uint], [Uintptr], [Uint8], [Uint16], [Uint32], or [Uint64].
    **/
    @:native("OverflowUint") function overflowUint(x: go.UInt64): (Bool);
    /**
        Pointer returns v's value as a uintptr.
        It panics if v's Kind is not [Chan], [Func], [Map], [Pointer], [Slice], [String], or [UnsafePointer].
        
        If v's Kind is [Func], the returned pointer is an underlying
        code pointer, but not necessarily enough to identify a
        single function uniquely. The only guarantee is that the
        result is zero if and only if v is a nil func Value.
        
        If v's Kind is [Slice], the returned pointer is to the first
        element of the slice. If the slice is nil the returned value
        is 0.  If the slice is empty but non-nil the return value is non-zero.
        
        If v's Kind is [String], the returned pointer is to the first
        element of the underlying bytes of string.
        
        It's preferred to use uintptr(Value.UnsafePointer()) to get the equivalent result.
    **/
    @:native("Pointer") function pointer(): (go.UIntPtr);
    /**
        Recv receives and returns a value from the channel v.
        It panics if v's Kind is not [Chan].
        The receive blocks until a value is ready.
        The boolean value ok is true if the value x corresponds to a send
        on the channel, false if it is a zero value received because the channel is closed.
    **/
    @:go.Tuple("x", "ok") @:native("Recv") function recv(): (go.Tuple<{ x: go.reflect.Value, ok: Bool }>);
    /**
        Send sends x on the channel v.
        It panics if v's kind is not [Chan] or if x's type is not the same type as v's element type.
        As in Go, x's value must be assignable to the channel's element type.
    **/
    @:native("Send") function send(x: go.reflect.Value): Void;
    /**
        Seq returns an iter.Seq[Value] that loops over the elements of v.
        If v's kind is Func, it must be a function that has no results and
        that takes a single argument of type func(T) bool for some type T.
        If v's kind is Pointer, the pointer element type must have kind Array.
        Otherwise v's kind must be Int, Int8, Int16, Int32, Int64,
        Uint, Uint8, Uint16, Uint32, Uint64, Uintptr,
        Array, Chan, Map, Slice, or String.
    **/
    @:native("Seq") function seq(): (go.iter.Seq<go.reflect.Value>);
    /**
        Seq2 returns an iter.Seq2[Value, Value] that loops over the elements of v.
        If v's kind is Func, it must be a function that has no results and
        that takes a single argument of type func(K, V) bool for some type K, V.
        If v's kind is Pointer, the pointer element type must have kind Array.
        Otherwise v's kind must be Array, Map, Slice, or String.
    **/
    @:native("Seq2") function seq2(): (go.iter.Seq2<go.reflect.Value, go.reflect.Value>);
    /**
        Set assigns x to the value v.
        It panics if [Value.CanSet] returns false.
        As in Go, x's value must be assignable to v's type and
        must not be derived from an unexported field.
    **/
    @:native("Set") function set(x: go.reflect.Value): Void;
    /**
        SetBool sets v's underlying value.
        It panics if v's Kind is not [Bool] or if [Value.CanSet] returns false.
    **/
    @:native("SetBool") function setBool(x: Bool): Void;
    /**
        SetBytes sets v's underlying value.
        It panics if v's underlying value is not a slice of bytes
        or if [Value.CanSet] returns false.
    **/
    @:native("SetBytes") function setBytes(x: go.Slice<go.Byte>): Void;
    /**
        SetCap sets v's capacity to n.
        It panics if v's Kind is not [Slice], or if n is smaller than the length or
        greater than the capacity of the slice,
        or if [Value.CanSet] returns false.
    **/
    @:native("SetCap") function setCap(n: go.GoInt): Void;
    /**
        SetComplex sets v's underlying value to x.
        It panics if v's Kind is not [Complex64] or [Complex128],
        or if [Value.CanSet] returns false.
    **/
    @:native("SetComplex") function setComplex(x: go.Complex128): Void;
    /**
        SetFloat sets v's underlying value to x.
        It panics if v's Kind is not [Float32] or [Float64],
        or if [Value.CanSet] returns false.
    **/
    @:native("SetFloat") function setFloat(x: Float): Void;
    /**
        SetInt sets v's underlying value to x.
        It panics if v's Kind is not [Int], [Int8], [Int16], [Int32], or [Int64],
        or if [Value.CanSet] returns false.
    **/
    @:native("SetInt") function setInt(x: go.Int64): Void;
    /**
        SetIterKey assigns to v the key of iter's current map entry.
        It is equivalent to v.Set(iter.Key()), but it avoids allocating a new Value.
        As in Go, the key must be assignable to v's type and
        must not be derived from an unexported field.
        It panics if [Value.CanSet] returns false.
    **/
    @:native("SetIterKey") function setIterKey(iter: go.Pointer<go.reflect.MapIter>): Void;
    /**
        SetIterValue assigns to v the value of iter's current map entry.
        It is equivalent to v.Set(iter.Value()), but it avoids allocating a new Value.
        As in Go, the value must be assignable to v's type and
        must not be derived from an unexported field.
        It panics if [Value.CanSet] returns false.
    **/
    @:native("SetIterValue") function setIterValue(iter: go.Pointer<go.reflect.MapIter>): Void;
    /**
        SetLen sets v's length to n.
        It panics if v's Kind is not [Slice], or if n is negative or
        greater than the capacity of the slice,
        or if [Value.CanSet] returns false.
    **/
    @:native("SetLen") function setLen(n: go.GoInt): Void;
    /**
        SetMapIndex sets the element associated with key in the map v to elem.
        It panics if v's Kind is not [Map].
        If elem is the zero Value, SetMapIndex deletes the key from the map.
        Otherwise if v holds a nil map, SetMapIndex will panic.
        As in Go, key's elem must be assignable to the map's key type,
        and elem's value must be assignable to the map's elem type.
    **/
    @:native("SetMapIndex") function setMapIndex(key: go.reflect.Value, elem: go.reflect.Value): Void;
    /**
        SetPointer sets the [unsafe.Pointer] value v to x.
        It panics if v's Kind is not [UnsafePointer]
        or if [Value.CanSet] returns false.
    **/
    @:native("SetPointer") function setPointer(x: go.unsafe.Pointer): Void;
    /**
        SetString sets v's underlying value to x.
        It panics if v's Kind is not [String] or if [Value.CanSet] returns false.
    **/
    @:native("SetString") function setString(x: std.String): Void;
    /**
        SetUint sets v's underlying value to x.
        It panics if v's Kind is not [Uint], [Uintptr], [Uint8], [Uint16], [Uint32], or [Uint64],
        or if [Value.CanSet] returns false.
    **/
    @:native("SetUint") function setUint(x: go.UInt64): Void;
    /**
        SetZero sets v to be the zero value of v's type.
        It panics if [Value.CanSet] returns false.
    **/
    @:native("SetZero") function setZero(): Void;
    /**
        Slice returns v[i:j].
        It panics if v's Kind is not [Array], [Slice] or [String], or if v is an unaddressable array,
        or if the indexes are out of bounds.
    **/
    @:native("Slice") function slice(i: go.GoInt, j: go.GoInt): (go.reflect.Value);
    /**
        Slice3 is the 3-index form of the slice operation: it returns v[i:j:k].
        It panics if v's Kind is not [Array] or [Slice], or if v is an unaddressable array,
        or if the indexes are out of bounds.
    **/
    @:native("Slice3") function slice3(i: go.GoInt, j: go.GoInt, k: go.GoInt): (go.reflect.Value);
    /**
        String returns the string v's underlying value, as a string.
        String is a special case because of Go's String method convention.
        Unlike the other getters, it does not panic if v's Kind is not [String].
        Instead, it returns a string of the form "<T value>" where T is v's type.
        The fmt package treats Values specially. It does not call their String
        method implicitly but instead prints the concrete values they hold.
    **/
    @:native("String") function string(): (std.String);
    /**
        TryRecv attempts to receive a value from the channel v but will not block.
        It panics if v's Kind is not [Chan].
        If the receive delivers a value, x is the transferred value and ok is true.
        If the receive cannot finish without blocking, x is the zero Value and ok is false.
        If the channel is closed, x is the zero value for the channel's element type and ok is false.
    **/
    @:go.Tuple("x", "ok") @:native("TryRecv") function tryRecv(): (go.Tuple<{ x: go.reflect.Value, ok: Bool }>);
    /**
        TrySend attempts to send x on the channel v but will not block.
        It panics if v's Kind is not [Chan].
        It reports whether the value was sent.
        As in Go, x's value must be assignable to the channel's element type.
    **/
    @:native("TrySend") function trySend(x: go.reflect.Value): (Bool);
    /**
        Type returns v's type.
    **/
    @:native("Type") function type(): (go.reflect.Type);
    /**
        Uint returns v's underlying value, as a uint64.
        It panics if v's Kind is not [Uint], [Uintptr], [Uint8], [Uint16], [Uint32], or [Uint64].
    **/
    @:native("Uint") function uint(): (go.UInt64);
    /**
        UnsafeAddr returns a pointer to v's data, as a uintptr.
        It panics if v is not addressable.
        
        It's preferred to use uintptr(Value.Addr().UnsafePointer()) to get the equivalent result.
    **/
    @:native("UnsafeAddr") function unsafeAddr(): (go.UIntPtr);
    /**
        UnsafePointer returns v's value as a [unsafe.Pointer].
        It panics if v's Kind is not [Chan], [Func], [Map], [Pointer], [Slice], [String] or [UnsafePointer].
        
        If v's Kind is [Func], the returned pointer is an underlying
        code pointer, but not necessarily enough to identify a
        single function uniquely. The only guarantee is that the
        result is zero if and only if v is a nil func Value.
        
        If v's Kind is [Slice], the returned pointer is to the first
        element of the slice. If the slice is nil the returned value
        is nil.  If the slice is empty but non-nil the return value is non-nil.
        
        If v's Kind is [String], the returned pointer is to the first
        element of the underlying bytes of string.
    **/
    @:native("UnsafePointer") function unsafePointer(): (go.unsafe.Pointer);

}