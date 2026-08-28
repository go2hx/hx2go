package go.debug.plan9obj;

/**
    A FileHeader represents a Plan 9 a.out file header.
**/
@:structInit
@:go.Type({ name: "FileHeader", instanceName: "plan9obj.FileHeader", imports: ["debug/plan9obj"] })
extern class FileHeader {

    @:native("Magic") var magic: go.UInt32;
    @:native("Bss") var bss: go.UInt32;
    @:native("Entry") var entry: go.UInt64;
    @:native("PtrSize") var ptrSize: go.GoInt;
    @:native("LoadAddress") var loadAddress: go.UInt64;
    @:native("HdrSize") var hdrSize: go.UInt64;

    function new(magic: go.UInt32=0, bss: go.UInt32=0, entry: go.UInt64=0, ptrSize: go.GoInt=0, loadAddress: go.UInt64=0, hdrSize: go.UInt64=0);

}