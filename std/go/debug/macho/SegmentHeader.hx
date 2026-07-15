package go.debug.macho;

@:structInit
@:go.Type({ name: "SegmentHeader", instanceName: "macho.SegmentHeader", imports: ["debug/macho"] })
extern class SegmentHeader {

    @:native("Cmd") var cmd: go.debug.macho.LoadCmd;
    @:native("Len") var len: go.UInt32;
    @:native("Name") var name: String;
    @:native("Addr") var addr: go.UInt64;
    @:native("Memsz") var memsz: go.UInt64;
    @:native("Offset") var offset: go.UInt64;
    @:native("Filesz") var filesz: go.UInt64;
    @:native("Maxprot") var maxprot: go.UInt32;
    @:native("Prot") var prot: go.UInt32;
    @:native("Nsect") var nsect: go.UInt32;
    @:native("Flag") var flag: go.UInt32;

function new(cmd: go.debug.macho.LoadCmd, len: go.UInt32, name: String, addr: go.UInt64, memsz: go.UInt64, offset: go.UInt64, filesz: go.UInt64, maxprot: go.UInt32, prot: go.UInt32, nsect: go.UInt32, flag: go.UInt32);

}