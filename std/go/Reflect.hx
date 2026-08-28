package go;

/**
    Package reflect implements run-time reflection, allowing a program to
    manipulate objects with arbitrary types. The typical use is to take a value
    with static type interface{} and extract its dynamic type information by
    calling TypeOf, which returns a Type.
    
    A call to ValueOf returns a Value representing the run-time data.
    Zero takes a Type and returns a Value representing a zero value
    for that type.
    
    See "The Laws of Reflection" for an introduction to reflection in Go:
    https://golang.org/doc/articles/laws_of_reflection.html
**/
@:go.Type({ name: "reflect", instanceName: "reflect.reflect", imports: ["reflect"] })
extern class Reflect {

    @:native("Array") static var array: go.reflect.Kind;
    @:native("Bool") static var bool: go.reflect.Kind;
    @:native("BothDir") static var bothDir: go.reflect.ChanDir;
    @:native("Chan") static var chan: go.reflect.Kind;
    @:native("Complex128") static var complex128: go.reflect.Kind;
    @:native("Complex64") static var complex64: go.reflect.Kind;
    @:native("Float32") static var float32: go.reflect.Kind;
    @:native("Float64") static var float64: go.reflect.Kind;
    @:native("Func") static var func: go.reflect.Kind;
    @:native("Int") static var int: go.reflect.Kind;
    @:native("Int16") static var int16: go.reflect.Kind;
    @:native("Int32") static var int32: go.reflect.Kind;
    @:native("Int64") static var int64: go.reflect.Kind;
    @:native("Int8") static var int8: go.reflect.Kind;
    @:native("Interface") static var _interface: go.reflect.Kind;
    @:native("Invalid") static var invalid: go.reflect.Kind;
    @:native("Map") static var map: go.reflect.Kind;
    @:native("Pointer") static var pointer: go.reflect.Kind;
    /**
        Ptr is the old name for the [Pointer] kind.
    **/
    @:native("Ptr") static var ptr: go.reflect.Kind;
    @:native("RecvDir") static var recvDir: go.reflect.ChanDir;
    @:native("SelectDefault") static var selectDefault: go.reflect.SelectDir;
    @:native("SelectRecv") static var selectRecv: go.reflect.SelectDir;
    @:native("SelectSend") static var selectSend: go.reflect.SelectDir;
    @:native("SendDir") static var sendDir: go.reflect.ChanDir;
    @:native("Slice") static var slice: go.reflect.Kind;
    @:native("String") static var string: go.reflect.Kind;
    @:native("Struct") static var struct: go.reflect.Kind;
    @:native("Uint") static var uint: go.reflect.Kind;
    @:native("Uint16") static var uint16: go.reflect.Kind;
    @:native("Uint32") static var uint32: go.reflect.Kind;
    @:native("Uint64") static var uint64: go.reflect.Kind;
    @:native("Uint8") static var uint8: go.reflect.Kind;
    @:native("Uintptr") static var uintptr: go.reflect.Kind;
    @:native("UnsafePointer") static var unsafePointer: go.reflect.Kind;

    /**
        Append appends the values x to a slice s and returns the resulting slice.
        As in Go, each x's value must be assignable to the slice's element type.
    **/
    @:native("Append") static function append(s: go.reflect.Value, x: haxe.Rest<go.reflect.Value>): (go.reflect.Value);
    /**
        AppendSlice appends a slice t to a slice s and returns the resulting slice.
        The slices s and t must have the same element type.
    **/
    @:native("AppendSlice") static function appendSlice(s: go.reflect.Value, t: go.reflect.Value): (go.reflect.Value);
    /**
        ArrayOf returns the array type with the given length and element type.
        For example, if t represents int, ArrayOf(5, t) represents [5]int.
        
        If the resulting type would be larger than the available address space,
        ArrayOf panics.
    **/
    @:native("ArrayOf") static function arrayOf(length: go.GoInt, elem: go.reflect.Type): (go.reflect.Type);
    /**
        ChanOf returns the channel type with the given direction and element type.
        For example, if t represents int, ChanOf(RecvDir, t) represents <-chan int.
        
        The gc runtime imposes a limit of 64 kB on channel element types.
        If t's size is equal to or exceeds this limit, ChanOf panics.
    **/
    @:native("ChanOf") static function chanOf(dir: go.reflect.ChanDir, t: go.reflect.Type): (go.reflect.Type);
    /**
        Copy copies the contents of src into dst until either
        dst has been filled or src has been exhausted.
        It returns the number of elements copied.
        Dst and src each must have kind [Slice] or [Array], and
        dst and src must have the same element type.
        It dst is an [Array], it panics if [Value.CanSet] returns false.
        
        As a special case, src can have kind [String] if the element type of dst is kind [Uint8].
    **/
    @:native("Copy") static function copy(dst: go.reflect.Value, src: go.reflect.Value): (go.GoInt);
    /**
        DeepEqual reports whether x and y are “deeply equal,” defined as follows.
        Two values of identical type are deeply equal if one of the following cases applies.
        Values of distinct types are never deeply equal.
        
        Array values are deeply equal when their corresponding elements are deeply equal.
        
        Struct values are deeply equal if their corresponding fields,
        both exported and unexported, are deeply equal.
        
        Func values are deeply equal if both are nil; otherwise they are not deeply equal.
        
        Interface values are deeply equal if they hold deeply equal concrete values.
        
        Map values are deeply equal when all of the following are true:
        they are both nil or both non-nil, they have the same length,
        and either they are the same map object or their corresponding keys
        (matched using Go equality) map to deeply equal values.
        
        Pointer values are deeply equal if they are equal using Go's == operator
        or if they point to deeply equal values.
        
        Slice values are deeply equal when all of the following are true:
        they are both nil or both non-nil, they have the same length,
        and either they point to the same initial entry of the same underlying array
        (that is, &x[0] == &y[0]) or their corresponding elements (up to length) are deeply equal.
        Note that a non-nil empty slice and a nil slice (for example, []byte{} and []byte(nil))
        are not deeply equal.
        
        Other values - numbers, bools, strings, and channels - are deeply equal
        if they are equal using Go's == operator.
        
        In general DeepEqual is a recursive relaxation of Go's == operator.
        However, this idea is impossible to implement without some inconsistency.
        Specifically, it is possible for a value to be unequal to itself,
        either because it is of func type (uncomparable in general)
        or because it is a floating-point NaN value (not equal to itself in floating-point comparison),
        or because it is an array, struct, or interface containing
        such a value.
        On the other hand, pointer values are always equal to themselves,
        even if they point at or contain such problematic values,
        because they compare equal using Go's == operator, and that
        is a sufficient condition to be deeply equal, regardless of content.
        DeepEqual has been defined so that the same short-cut applies
        to slices and maps: if x and y are the same slice or the same map,
        they are deeply equal regardless of content.
        
        As DeepEqual traverses the data values it may find a cycle. The
        second and subsequent times that DeepEqual compares two pointer
        values that have been compared before, it treats the values as
        equal rather than examining the values to which they point.
        This ensures that DeepEqual terminates.
    **/
    @:native("DeepEqual") static function deepEqual(x: Dynamic, y: Dynamic): (Bool);
    /**
        FuncOf returns the function type with the given argument and result types.
        For example if k represents int and e represents string,
        FuncOf([]Type{k}, []Type{e}, false) represents func(int) string.
        
        The variadic argument controls whether the function is variadic. FuncOf
        panics if the in[len(in)-1] does not represent a slice and variadic is
        true.
    **/
    @:native("FuncOf") static function funcOf(_in: go.Slice<go.reflect.Type>, out: go.Slice<go.reflect.Type>, variadic: Bool): (go.reflect.Type);
    /**
        Indirect returns the value that v points to.
        If v is a nil pointer, Indirect returns a zero Value.
        If v is not a pointer, Indirect returns v.
    **/
    @:native("Indirect") static function indirect(v: go.reflect.Value): (go.reflect.Value);
    /**
        MakeChan creates a new channel with the specified type and buffer size.
    **/
    @:native("MakeChan") static function makeChan(typ: go.reflect.Type, buffer: go.GoInt): (go.reflect.Value);
    /**
        MakeFunc returns a new function of the given [Type]
        that wraps the function fn. When called, that new function
        does the following:
        
          - converts its arguments to a slice of Values.
          - runs results := fn(args).
          - returns the results as a slice of Values, one per formal result.
        
        The implementation fn can assume that the argument [Value] slice
        has the number and type of arguments given by typ.
        If typ describes a variadic function, the final Value is itself
        a slice representing the variadic arguments, as in the
        body of a variadic function. The result Value slice returned by fn
        must have the number and type of results given by typ.
        
        The [Value.Call] method allows the caller to invoke a typed function
        in terms of Values; in contrast, MakeFunc allows the caller to implement
        a typed function in terms of Values.
        
        The Examples section of the documentation includes an illustration
        of how to use MakeFunc to build a swap function for different types.
    **/
    @:native("MakeFunc") static function makeFunc(typ: go.reflect.Type, fn: (args: go.Slice<go.reflect.Value>) -> (go.Slice<go.reflect.Value>)): (go.reflect.Value);
    /**
        MakeMap creates a new map with the specified type.
    **/
    @:native("MakeMap") static function makeMap(typ: go.reflect.Type): (go.reflect.Value);
    /**
        MakeMapWithSize creates a new map with the specified type
        and initial space for approximately n elements.
    **/
    @:native("MakeMapWithSize") static function makeMapWithSize(typ: go.reflect.Type, n: go.GoInt): (go.reflect.Value);
    /**
        MakeSlice creates a new zero-initialized slice value
        for the specified slice type, length, and capacity.
    **/
    @:native("MakeSlice") static function makeSlice(typ: go.reflect.Type, len: go.GoInt, cap: go.GoInt): (go.reflect.Value);
    /**
        MapOf returns the map type with the given key and element types.
        For example, if k represents int and e represents string,
        MapOf(k, e) represents map[int]string.
        
        If the key type is not a valid map key type (that is, if it does
        not implement Go's == operator), MapOf panics.
    **/
    @:native("MapOf") static function mapOf(key: go.reflect.Type, elem: go.reflect.Type): (go.reflect.Type);
    /**
        New returns a Value representing a pointer to a new zero value
        for the specified type. That is, the returned Value's Type is [PointerTo](typ).
    **/
    @:native("New") static function _new(typ: go.reflect.Type): (go.reflect.Value);
    /**
        NewAt returns a Value representing a pointer to a value of the
        specified type, using p as that pointer.
    **/
    @:native("NewAt") static function newAt(typ: go.reflect.Type, p: go.unsafe.Pointer): (go.reflect.Value);
    /**
        PointerTo returns the pointer type with element t.
        For example, if t represents type Foo, PointerTo(t) represents *Foo.
    **/
    @:native("PointerTo") static function pointerTo(t: go.reflect.Type): (go.reflect.Type);
    /**
        PtrTo returns the pointer type with element t.
        For example, if t represents type Foo, PtrTo(t) represents *Foo.
        
        PtrTo is the old spelling of [PointerTo].
        The two functions behave identically.
        
        Deprecated: Superseded by [PointerTo].
    **/
    @:native("PtrTo") static function ptrTo(t: go.reflect.Type): (go.reflect.Type);
    /**
        Select executes a select operation described by the list of cases.
        Like the Go select statement, it blocks until at least one of the cases
        can proceed, makes a uniform pseudo-random choice,
        and then executes that case. It returns the index of the chosen case
        and, if that case was a receive operation, the value received and a
        boolean indicating whether the value corresponds to a send on the channel
        (as opposed to a zero value received because the channel is closed).
        Select supports a maximum of 65536 cases.
    **/
    @:go.Tuple("chosen", "recv", "recvOK") @:native("Select") static function select(cases: go.Slice<go.reflect.SelectCase>): (go.Tuple<{ chosen: go.GoInt, recv: go.reflect.Value, recvOK: Bool }>);
    /**
        SliceAt returns a [Value] representing a slice whose underlying
        data starts at p, with length and capacity equal to n.
        
        This is like [unsafe.Slice].
    **/
    @:native("SliceAt") static function sliceAt(typ: go.reflect.Type, p: go.unsafe.Pointer, n: go.GoInt): (go.reflect.Value);
    /**
        SliceOf returns the slice type with element type t.
        For example, if t represents int, SliceOf(t) represents []int.
    **/
    @:native("SliceOf") static function sliceOf(t: go.reflect.Type): (go.reflect.Type);
    /**
        StructOf returns the struct type containing fields.
        The Offset and Index fields are ignored and computed as they would be
        by the compiler.
        
        StructOf currently does not support promoted methods of embedded fields
        and panics if passed unexported StructFields.
    **/
    @:native("StructOf") static function structOf(fields: go.Slice<go.reflect.StructField>): (go.reflect.Type);
    /**
        Swapper returns a function that swaps the elements in the provided
        slice.
        
        Swapper panics if the provided interface is not a slice.
    **/
    @:native("Swapper") static function swapper(slice: Dynamic): ((i: go.GoInt, j: go.GoInt) -> Void);
    /**
        TypeAssert is semantically equivalent to:
        
        	v2, ok := v.Interface().(T)
    **/
    @:go.Tuple("p0", "p1") @:native("TypeAssert") static function typeAssert<T: Dynamic>(v: go.reflect.Value): (go.Tuple<{ p0: T, p1: Bool }>);
    /**
        TypeFor returns the [Type] that represents the type argument T.
    **/
    @:native("TypeFor") static function typeFor<T: Dynamic>(): (go.reflect.Type);
    /**
        TypeOf returns the reflection [Type] that represents the dynamic type of i.
        If i is a nil interface value, TypeOf returns nil.
    **/
    @:native("TypeOf") static function typeOf(i: Dynamic): (go.reflect.Type);
    /**
        ValueOf returns a new Value initialized to the concrete value
        stored in the interface i. ValueOf(nil) returns the zero Value.
    **/
    @:native("ValueOf") static function valueOf(i: Dynamic): (go.reflect.Value);
    /**
        VisibleFields returns all the visible fields in t, which must be a
        struct type. A field is defined as visible if it's accessible
        directly with a FieldByName call. The returned fields include fields
        inside anonymous struct members and unexported fields. They follow
        the same order found in the struct, with anonymous fields followed
        immediately by their promoted fields.
        
        For each element e of the returned slice, the corresponding field
        can be retrieved from a value v of type t by calling v.FieldByIndex(e.Index).
    **/
    @:native("VisibleFields") static function visibleFields(t: go.reflect.Type): (go.Slice<go.reflect.StructField>);
    /**
        Zero returns a Value representing the zero value for the specified type.
        The result is different from the zero value of the Value struct,
        which represents no value at all.
        For example, Zero(TypeOf(42)) returns a Value with Kind [Int] and value 0.
        The returned value is neither addressable nor settable.
    **/
    @:native("Zero") static function zero(typ: go.reflect.Type): (go.reflect.Value);

}