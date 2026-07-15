package go.debug.dwarf;

@:structInit
@:go.Type({ name: "Reader", instanceName: "dwarf.Reader", imports: ["debug/dwarf"] })
extern class Reader {

    @:native("AddressSize") function addressSize(): go.GoInt;
    @:native("ByteOrder") function byteOrder(): go.encoding.binary.ByteOrder;
    @:native("Next") function next(): go.Result<go.Pointer<go.debug.dwarf.Entry>>;
    @:native("Seek") function seek(off: go.debug.dwarf.Offset): Void;
    @:native("SeekPC") function seekPC(pc: go.UInt64): go.Result<go.Pointer<go.debug.dwarf.Entry>>;
    @:native("SkipChildren") function skipChildren(): Void;

}