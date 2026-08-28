package go.debug.dwarf;

/**
    A LineFile is a source file referenced by a DWARF line table entry.
**/
@:structInit
@:go.Type({ name: "LineFile", instanceName: "dwarf.LineFile", imports: ["debug/dwarf"] })
extern class LineFile {

    @:native("Name") var name: String;
    @:native("Mtime") var mtime: go.UInt64;
    @:native("Length") var length: go.GoInt;

    function new(name: String="", mtime: go.UInt64=0, length: go.GoInt=0);

}