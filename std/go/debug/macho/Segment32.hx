package go.debug.macho;

@:structInit
@:go.Type({ name: "Segment32", instanceName: "macho.Segment32", imports: ["debug/macho"] })
extern class Segment32 {

    @:native("Cmd") var cmd: go.debug.macho.LoadCmd;
    @:native("Len") var len: go.UInt32;
    @:native("Name") var name: go.GoArray<go.Byte, 16>;
    @:native("Addr") var addr: go.UInt32;
    @:native("Memsz") var memsz: go.UInt32;
    @:native("Offset") var offset: go.UInt32;
    @:native("Filesz") var filesz: go.UInt32;
    @:native("Maxprot") var maxprot: go.UInt32;
    @:native("Prot") var prot: go.UInt32;
    @:native("Nsect") var nsect: go.UInt32;
    @:native("Flag") var flag: go.UInt32;

function new(cmd: go.debug.macho.LoadCmd, len: go.UInt32, name: go.GoArray<go.Byte, 16>, addr: go.UInt32, memsz: go.UInt32, offset: go.UInt32, filesz: go.UInt32, maxprot: go.UInt32, prot: go.UInt32, nsect: go.UInt32, flag: go.UInt32);

}