package go.reflect;

@:structInit
@:go.Type({ name: "structType", instanceName: "reflect.structType", imports: ["reflect"] })
extern class StructType {

    @:native("StructType") var structType: go.internal.abi.StructType;

    function new(structType: go.internal.abi.StructType);

    @:native("Align") function align(): (go.GoInt);
    @:native("ArrayType") function arrayType(): (go.Pointer<go.internal.abi.ArrayType>);
    @:native("ChanDir") function chanDir(): (go.internal.abi.ChanDir);
    @:native("Common") function common(): (go.Pointer<go.internal.abi.Type>);
    @:native("Elem") function elem(): (go.Pointer<go.internal.abi.Type>);
    @:native("ExportedMethods") function exportedMethods(): (go.Slice<go.internal.abi.Method>);
    @:native("Field") function field(i: go.GoInt): (go.reflect.StructField);
    @:native("FieldAlign") function fieldAlign(): (go.GoInt);
    @:native("FieldByIndex") function fieldByIndex(index: go.Slice<go.GoInt>): (go.reflect.StructField);
    @:go.Tuple("f", "present") @:native("FieldByName") function fieldByName(name: String): go.Tuple<{ f: go.reflect.StructField, present: Bool }>;
    @:go.Tuple("result", "ok") @:native("FieldByNameFunc") function fieldByNameFunc(match: (p0: String) -> (Bool)): go.Tuple<{ result: go.reflect.StructField, ok: Bool }>;
    @:native("FuncType") function funcType(): (go.Pointer<go.internal.abi.FuncType>);
    @:native("GcSlice") function gcSlice(begin: go.UIntPtr, end: go.UIntPtr): (go.Slice<go.Byte>);
    @:native("HasName") function hasName(): (Bool);
    @:native("InterfaceType") function interfaceType(): (go.Pointer<go.internal.abi.InterfaceType>);
    @:native("IsDirectIface") function isDirectIface(): (Bool);
    @:native("Key") function key(): (go.Pointer<go.internal.abi.Type>);
    @:native("Kind") function kind(): (go.internal.abi.Kind);
    @:native("Len") function len(): (go.GoInt);
    @:native("MapType") function mapType(): (go.Pointer<go.internal.abi.MapType>);
    @:native("NumMethod") function numMethod(): (go.GoInt);
    @:native("Pointers") function pointers(): (Bool);
    @:native("Size") function size(): (go.UIntPtr);
    @:native("Uncommon") function uncommon(): (go.Pointer<go.internal.abi.UncommonType>);

}