package go.reflect;

@:structInit
@:go.Type({ name: "interfaceType", instanceName: "reflect.interfaceType", imports: ["reflect"] })
extern class InterfaceType {

    @:native("InterfaceType") var interfaceType: go.internal.abi.InterfaceType;

    function new(interfaceType: go.internal.abi.InterfaceType);

    @:native("Align") function align(): (go.GoInt);
    @:native("ArrayType") function arrayType(): (go.Pointer<go.internal.abi.ArrayType>);
    @:native("ChanDir") function chanDir(): (go.internal.abi.ChanDir);
    @:native("Common") function common(): (go.Pointer<go.internal.abi.Type>);
    @:native("Elem") function elem(): (go.Pointer<go.internal.abi.Type>);
    @:native("ExportedMethods") function exportedMethods(): (go.Slice<go.internal.abi.Method>);
    @:native("FieldAlign") function fieldAlign(): (go.GoInt);
    @:native("FuncType") function funcType(): (go.Pointer<go.internal.abi.FuncType>);
    @:native("GcSlice") function gcSlice(begin: go.UIntPtr, end: go.UIntPtr): (go.Slice<go.Byte>);
    @:native("HasName") function hasName(): (Bool);
    @:native("IsDirectIface") function isDirectIface(): (Bool);
    @:native("Key") function key(): (go.Pointer<go.internal.abi.Type>);
    @:native("Kind") function kind(): (go.internal.abi.Kind);
    @:native("Len") function len(): (go.GoInt);
    @:native("MapType") function mapType(): (go.Pointer<go.internal.abi.MapType>);
    @:native("Method") function method(i: go.GoInt): (go.reflect.Method);
    @:go.Tuple("m", "ok") @:native("MethodByName") function methodByName(name: String): go.Tuple<{ m: go.reflect.Method, ok: Bool }>;
    @:native("NumMethod") function numMethod(): (go.GoInt);
    @:native("Pointers") function pointers(): (Bool);
    @:native("Size") function size(): (go.UIntPtr);
    @:native("StructType") function structType(): (go.Pointer<go.internal.abi.StructType>);
    @:native("Uncommon") function uncommon(): (go.Pointer<go.internal.abi.UncommonType>);

}