package go.debug.elf;

@:structInit
@:go.Type({ name: "Header64", instanceName: "elf.Header64", imports: ["debug/elf"] })
extern class Header64 {

    @:native("Ident") var ident: go.GoArray<go.Byte, 16>;
    @:native("Type") var type: go.UInt16;
    @:native("Machine") var machine: go.UInt16;
    @:native("Version") var version: go.UInt32;
    @:native("Entry") var entry: go.UInt64;
    @:native("Phoff") var phoff: go.UInt64;
    @:native("Shoff") var shoff: go.UInt64;
    @:native("Flags") var flags: go.UInt32;
    @:native("Ehsize") var ehsize: go.UInt16;
    @:native("Phentsize") var phentsize: go.UInt16;
    @:native("Phnum") var phnum: go.UInt16;
    @:native("Shentsize") var shentsize: go.UInt16;
    @:native("Shnum") var shnum: go.UInt16;
    @:native("Shstrndx") var shstrndx: go.UInt16;

    function new(ident: go.GoArray<go.Byte, 16>, type: go.UInt16=0, machine: go.UInt16=0, version: go.UInt32=0, entry: go.UInt64=0, phoff: go.UInt64=0, shoff: go.UInt64=0, flags: go.UInt32=0, ehsize: go.UInt16=0, phentsize: go.UInt16=0, phnum: go.UInt16=0, shentsize: go.UInt16=0, shnum: go.UInt16=0, shstrndx: go.UInt16=0);

}