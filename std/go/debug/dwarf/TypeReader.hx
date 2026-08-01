package go.debug.dwarf;

@:go.Type({ name: "typeReader", instanceName: "dwarf.typeReader", imports: ["debug/dwarf"] })
extern typedef TypeReader = {

    @:native("AddressSize") function addressSize(): (go.GoInt);
    @:native("Next") function next(): (go.Result<go.Pointer<go.debug.dwarf.Entry>>);
    @:native("Seek") function seek(p0: go.debug.dwarf.Offset): Void;

}