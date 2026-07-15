package go.internal.abi;

@:structInit
@:go.Type({ name: "FuncType", instanceName: "abi.FuncType", imports: ["internal/abi"] })
extern class FuncType {

    @:native("Type") var type: go.internal.abi.Type;
    @:native("InCount") var inCount: go.UInt16;
    @:native("OutCount") var outCount: go.UInt16;

function new(type: go.internal.abi.Type, inCount: go.UInt16, outCount: go.UInt16);

    @:native("Align") function align(): go.GoInt;
    @:native("ArrayType") function arrayType(): go.Pointer<go.internal.abi.ArrayType>;
    @:native("ChanDir") function chanDir(): go.internal.abi.ChanDir;
    @:native("Common") function common(): go.Pointer<go.internal.abi.Type>;
    @:native("Elem") function elem(): go.Pointer<go.internal.abi.Type>;
    @:native("ExportedMethods") function exportedMethods(): go.Slice<go.internal.abi.Method>;
    @:native("FieldAlign") function fieldAlign(): go.GoInt;
    @:native("FuncType") function funcType(): go.Pointer<go.internal.abi.FuncType>;
    @:native("GcSlice") function gcSlice(begin: go.UIntPtr, end: go.UIntPtr): go.Slice<go.Byte>;
    @:native("HasName") function hasName(): Bool;
    @:native("In") function _in(i: go.GoInt): go.Pointer<go.internal.abi.Type>;
    @:native("InSlice") function inSlice(): go.Slice<go.Pointer<go.internal.abi.Type>>;
    @:native("InterfaceType") function interfaceType(): go.Pointer<go.internal.abi.InterfaceType>;
    @:native("IsDirectIface") function isDirectIface(): Bool;
    @:native("IsVariadic") function isVariadic(): Bool;
    @:native("Key") function key(): go.Pointer<go.internal.abi.Type>;
    @:native("Kind") function kind(): go.internal.abi.Kind;
    @:native("Len") function len(): go.GoInt;
    @:native("MapType") function mapType(): go.Pointer<go.internal.abi.MapType>;
    @:native("NumIn") function numIn(): go.GoInt;
    @:native("NumMethod") function numMethod(): go.GoInt;
    @:native("NumOut") function numOut(): go.GoInt;
    @:native("Out") function out(i: go.GoInt): go.Pointer<go.internal.abi.Type>;
    @:native("OutSlice") function outSlice(): go.Slice<go.Pointer<go.internal.abi.Type>>;
    @:native("Pointers") function pointers(): Bool;
    @:native("Size") function size(): go.UIntPtr;
    @:native("StructType") function structType(): go.Pointer<go.internal.abi.StructType>;
    @:native("Uncommon") function uncommon(): go.Pointer<go.internal.abi.UncommonType>;

}