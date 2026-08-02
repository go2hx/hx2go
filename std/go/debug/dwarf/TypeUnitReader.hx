package go.debug.dwarf;

@:structInit
@:go.Type({ name: "typeUnitReader", instanceName: "dwarf.typeUnitReader", imports: ["debug/dwarf"] })
extern class TypeUnitReader {

    @:native("AddressSize") function addressSize(): (go.GoInt);
    @:native("Next") function next(): (go.Result<go.Pointer<go.debug.dwarf.Entry>>);
    @:native("Seek") function seek(off: go.debug.dwarf.Offset): Void;

}