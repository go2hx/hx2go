package go.debug.macho;

/**
    A Segment64 is a 64-bit Mach-O segment load command.
**/
@:structInit
@:go.Type({ name: "Segment64", instanceName: "macho.Segment64", imports: ["debug/macho"] })
extern class Segment64 {

    @:native("Cmd") var cmd: go.debug.macho.LoadCmd;
    @:native("Len") var len: go.UInt32;
    @:native("Name") var name: go.GoArray<go.Byte, 16>;
    @:native("Addr") var addr: go.UInt64;
    @:native("Memsz") var memsz: go.UInt64;
    @:native("Offset") var offset: go.UInt64;
    @:native("Filesz") var filesz: go.UInt64;
    @:native("Maxprot") var maxprot: go.UInt32;
    @:native("Prot") var prot: go.UInt32;
    @:native("Nsect") var nsect: go.UInt32;
    @:native("Flag") var flag: go.UInt32;

    function new(cmd: go.debug.macho.LoadCmd=cast 0, len: go.UInt32=0, name: go.GoArray<go.Byte, 16>, addr: go.UInt64=0, memsz: go.UInt64=0, offset: go.UInt64=0, filesz: go.UInt64=0, maxprot: go.UInt32=0, prot: go.UInt32=0, nsect: go.UInt32=0, flag: go.UInt32=0);

}