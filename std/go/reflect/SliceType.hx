package go.reflect;

@:structInit
@:go.Type({ name: "sliceType", instanceName: "reflect.sliceType", imports: ["reflect"] })
extern class SliceType {

    @:native("SliceType") var sliceType: Dynamic;
    @:native("Type") var type: Dynamic;
    @:native("Elem") var elem: go.Pointer<Dynamic>;
    @:native("Size_") var size_: go.UIntPtr;
    @:native("PtrBytes") var ptrBytes: go.UIntPtr;
    @:native("Hash") var hash: go.UInt32;
    @:native("TFlag") var tFlag: Dynamic;
    @:native("Align_") var align_: go.UInt8;
    @:native("FieldAlign_") var fieldAlign_: go.UInt8;
    @:native("Kind_") var kind_: Dynamic;
    @:native("Equal") var equal: (p0: go.unsafe.Pointer, p1: go.unsafe.Pointer) -> (Bool);
    @:native("GCData") var gCData: go.Pointer<go.Byte>;
    @:native("Str") var str: Dynamic;
    @:native("PtrToThis") var ptrToThis: Dynamic;

    function new(sliceType: Dynamic);

    @:native("Align") function align(): (go.GoInt);
    @:native("ArrayType") function arrayType(): (go.Pointer<Dynamic>);
    @:native("ChanDir") function chanDir(): (Dynamic);
    @:native("Common") function common(): (go.Pointer<Dynamic>);
    @:native("ExportedMethods") function exportedMethods(): (go.Slice<Dynamic>);
    @:native("FieldAlign") function fieldAlign(): (go.GoInt);
    @:native("FuncType") function funcType(): (go.Pointer<Dynamic>);
    @:native("GcSlice") function gcSlice(begin: go.UIntPtr, end: go.UIntPtr): (go.Slice<go.Byte>);
    @:native("HasName") function hasName(): (Bool);
    @:native("InterfaceType") function interfaceType(): (go.Pointer<Dynamic>);
    @:native("IsDirectIface") function isDirectIface(): (Bool);
    @:native("Key") function key(): (go.Pointer<Dynamic>);
    @:native("Kind") function kind(): (Dynamic);
    @:native("Len") function len(): (go.GoInt);
    @:native("MapType") function mapType(): (go.Pointer<Dynamic>);
    @:native("NumMethod") function numMethod(): (go.GoInt);
    @:native("Pointers") function pointers(): (Bool);
    @:native("Size") function size(): (go.UIntPtr);
    @:native("StructType") function structType(): (go.Pointer<Dynamic>);
    @:native("Uncommon") function uncommon(): (go.Pointer<Dynamic>);

}