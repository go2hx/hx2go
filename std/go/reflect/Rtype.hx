package go.reflect;

@:structInit
@:go.Type({ name: "rtype", instanceName: "reflect.rtype", imports: ["reflect"] })
extern class Rtype {

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
    @:go.Tuple("p0", "p1") @:native("FieldByName") function fieldByName(name: String): go.Tuple<{ p0: go.reflect.StructField, p1: Bool }>;
    @:go.Tuple("p0", "p1") @:native("FieldByNameFunc") function fieldByNameFunc(match: (p0: String) -> (Bool)): go.Tuple<{ p0: go.reflect.StructField, p1: Bool }>;
    @:native("Fields") function fields(): (go.iter.Seq<go.reflect.StructField>);
    @:native("Implements") function _implements(u: go.reflect.Type): (Bool);
    @:native("In") function _in(i: go.GoInt): (go.reflect.Type);
    @:native("Ins") function ins(): (go.iter.Seq<go.reflect.Type>);
    @:native("IsVariadic") function isVariadic(): (Bool);
    @:native("Key") function key(): (go.reflect.Type);
    @:native("Kind") function kind(): (go.reflect.Kind);
    @:native("Len") function len(): (go.GoInt);
    @:native("Method") function method(i: go.GoInt): (go.reflect.Method);
    @:go.Tuple("m", "ok") @:native("MethodByName") function methodByName(name: String): go.Tuple<{ m: go.reflect.Method, ok: Bool }>;
    @:native("Methods") function methods(): (go.iter.Seq<go.reflect.Method>);
    @:native("Name") function name(): (String);
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
    @:native("PkgPath") function pkgPath(): (String);
    @:native("Size") function size(): (go.UIntPtr);
    @:native("String") function string(): (String);

}