package go.reflect;

/**
    Type is the representation of a Go type.
    
    Not all methods apply to all kinds of types. Restrictions,
    if any, are noted in the documentation for each method.
    Use the Kind method to find out the kind of type before
    calling kind-specific methods. Calling a method
    inappropriate to the kind of type causes a run-time panic.
    
    Type values are comparable, such as with the == operator,
    so they can be used as map keys.
    Two Type values are equal if they represent identical types.
**/
@:go.Type({ name: "Type", instanceName: "reflect.Type", imports: ["reflect"] })
extern typedef Type = {

    @:native("Align") function align(): (go.GoInt);
    @:native("AssignableTo") function assignableTo(u: go.reflect.Type): (Bool);
    @:native("Bits") function bits(): (go.GoInt);
    @:native("CanSeq") function canSeq(): (Bool);
    @:native("CanSeq2") function canSeq2(): (Bool);
    @:native("ChanDir") function chanDir(): (go.reflect.ChanDir);
    @:native("Comparable") function comparable(): (Bool);
    @:native("ConvertibleTo") function convertibleTo(u: go.reflect.Type): (Bool);
    @:native("Elem") function elem(): (go.reflect.Type);
    @:native("Field") function field(i: go.GoInt): (go.reflect.StructField);
    @:native("FieldAlign") function fieldAlign(): (go.GoInt);
    @:native("FieldByIndex") function fieldByIndex(index: go.Slice<go.GoInt>): (go.reflect.StructField);
    @:go.Tuple("p0", "p1") @:native("FieldByName") function fieldByName(name: std.String): (go.Tuple<{ p0: go.reflect.StructField, p1: Bool }>);
    @:go.Tuple("p0", "p1") @:native("FieldByNameFunc") function fieldByNameFunc(match: (p0: std.String) -> (Bool)): (go.Tuple<{ p0: go.reflect.StructField, p1: Bool }>);
    @:native("Fields") function fields(): (go.iter.Seq<go.reflect.StructField>);
    @:native("Implements") function _implements(u: go.reflect.Type): (Bool);
    @:native("In") function _in(i: go.GoInt): (go.reflect.Type);
    @:native("Ins") function ins(): (go.iter.Seq<go.reflect.Type>);
    @:native("IsVariadic") function isVariadic(): (Bool);
    @:native("Key") function key(): (go.reflect.Type);
    @:native("Kind") function kind(): (go.reflect.Kind);
    @:native("Len") function len(): (go.GoInt);
    @:native("Method") function method(p0: go.GoInt): (go.reflect.Method);
    @:go.Tuple("p0", "p1") @:native("MethodByName") function methodByName(p0: std.String): (go.Tuple<{ p0: go.reflect.Method, p1: Bool }>);
    @:native("Methods") function methods(): (go.iter.Seq<go.reflect.Method>);
    @:native("Name") function name(): (std.String);
    @:native("NumField") function numField(): (go.GoInt);
    @:native("NumIn") function numIn(): (go.GoInt);
    @:native("NumMethod") function numMethod(): (go.GoInt);
    @:native("NumOut") function numOut(): (go.GoInt);
    @:native("Out") function out(i: go.GoInt): (go.reflect.Type);
    @:native("Outs") function outs(): (go.iter.Seq<go.reflect.Type>);
    @:native("OverflowComplex") function overflowComplex(x: go.Complex128): (Bool);
    @:native("OverflowFloat") function overflowFloat(x: Float): (Bool);
    @:native("OverflowInt") function overflowInt(x: go.Int64): (Bool);
    @:native("OverflowUint") function overflowUint(x: go.UInt64): (Bool);
    @:native("PkgPath") function pkgPath(): (std.String);
    @:native("Size") function size(): (go.UIntPtr);
    @:native("String") function string(): (std.String);

}