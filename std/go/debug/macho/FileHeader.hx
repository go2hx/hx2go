package go.debug.macho;

/**
    A FileHeader represents a Mach-O file header.
**/
@:structInit
@:go.Type({ name: "FileHeader", instanceName: "macho.FileHeader", imports: ["debug/macho"] })
extern class FileHeader {

    @:native("Magic") var magic: go.UInt32;
    @:native("Cpu") var cpu: go.debug.macho.Cpu;
    @:native("SubCpu") var subCpu: go.UInt32;
    @:native("Type") var type: go.debug.macho.Type;
    @:native("Ncmd") var ncmd: go.UInt32;
    @:native("Cmdsz") var cmdsz: go.UInt32;
    @:native("Flags") var flags: go.UInt32;

    function new(magic: go.UInt32=0, cpu: go.debug.macho.Cpu=cast 0, subCpu: go.UInt32=0, type: go.debug.macho.Type=cast 0, ncmd: go.UInt32=0, cmdsz: go.UInt32=0, flags: go.UInt32=0);

}