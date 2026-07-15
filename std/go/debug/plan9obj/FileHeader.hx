package go.debug.plan9obj;

@:structInit
@:go.Type({ name: "FileHeader", instanceName: "plan9obj.FileHeader", imports: ["debug/plan9obj"] })
extern class FileHeader {

    @:native("Magic") var magic: go.UInt32;
    @:native("Bss") var bss: go.UInt32;
    @:native("Entry") var entry: go.UInt64;
    @:native("PtrSize") var ptrSize: go.GoInt;
    @:native("LoadAddress") var loadAddress: go.UInt64;
    @:native("HdrSize") var hdrSize: go.UInt64;

function new(magic: go.UInt32, bss: go.UInt32, entry: go.UInt64, ptrSize: go.GoInt, loadAddress: go.UInt64, hdrSize: go.UInt64);

}