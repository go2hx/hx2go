package go.internal.abi;

@:structInit
@:go.Type({ name: "MapType", instanceName: "abi.MapType", imports: ["internal/abi"] })
extern class MapType {

    @:native("Type") var type: go.internal.abi.Type;
    @:native("Key") var key: go.Pointer<go.internal.abi.Type>;
    @:native("Elem") var elem: go.Pointer<go.internal.abi.Type>;
    @:native("Group") var group: go.Pointer<go.internal.abi.Type>;
    @:native("Hasher") var hasher: (p0: go.unsafe.Pointer, p1: go.UIntPtr) -> go.UIntPtr;
    @:native("GroupSize") var groupSize: go.UIntPtr;
    @:native("SlotSize") var slotSize: go.UIntPtr;
    @:native("ElemOff") var elemOff: go.UIntPtr;
    @:native("Flags") var flags: go.UInt32;

function new(type: go.internal.abi.Type, key: go.Pointer<go.internal.abi.Type>, elem: go.Pointer<go.internal.abi.Type>, group: go.Pointer<go.internal.abi.Type>, hasher: (p0: go.unsafe.Pointer, p1: go.UIntPtr) -> go.UIntPtr, groupSize: go.UIntPtr, slotSize: go.UIntPtr, elemOff: go.UIntPtr, flags: go.UInt32);

    @:native("Align") function align(): go.GoInt;
    @:native("ArrayType") function arrayType(): go.Pointer<go.internal.abi.ArrayType>;
    @:native("ChanDir") function chanDir(): go.internal.abi.ChanDir;
    @:native("Common") function common(): go.Pointer<go.internal.abi.Type>;
    @:native("ExportedMethods") function exportedMethods(): go.Slice<go.internal.abi.Method>;
    @:native("FieldAlign") function fieldAlign(): go.GoInt;
    @:native("FuncType") function funcType(): go.Pointer<go.internal.abi.FuncType>;
    @:native("GcSlice") function gcSlice(begin: go.UIntPtr, end: go.UIntPtr): go.Slice<go.Byte>;
    @:native("HasName") function hasName(): Bool;
    @:native("HashMightPanic") function hashMightPanic(): Bool;
    @:native("IndirectElem") function indirectElem(): Bool;
    @:native("IndirectKey") function indirectKey(): Bool;
    @:native("InterfaceType") function interfaceType(): go.Pointer<go.internal.abi.InterfaceType>;
    @:native("IsDirectIface") function isDirectIface(): Bool;
    @:native("Kind") function kind(): go.internal.abi.Kind;
    @:native("Len") function len(): go.GoInt;
    @:native("MapType") function mapType(): go.Pointer<go.internal.abi.MapType>;
    @:native("NeedKeyUpdate") function needKeyUpdate(): Bool;
    @:native("NumMethod") function numMethod(): go.GoInt;
    @:native("Pointers") function pointers(): Bool;
    @:native("Size") function size(): go.UIntPtr;
    @:native("StructType") function structType(): go.Pointer<go.internal.abi.StructType>;
    @:native("Uncommon") function uncommon(): go.Pointer<go.internal.abi.UncommonType>;

}