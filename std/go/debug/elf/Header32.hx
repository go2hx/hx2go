package go.debug.elf;

@:structInit
@:go.Type({ name: "Header32", instanceName: "elf.Header32", imports: ["debug/elf"] })
extern class Header32 {

    @:native("Ident") var ident: go.GoArray<go.Byte, 16>;
    @:native("Type") var type: go.UInt16;
    @:native("Machine") var machine: go.UInt16;
    @:native("Version") var version: go.UInt32;
    @:native("Entry") var entry: go.UInt32;
    @:native("Phoff") var phoff: go.UInt32;
    @:native("Shoff") var shoff: go.UInt32;
    @:native("Flags") var flags: go.UInt32;
    @:native("Ehsize") var ehsize: go.UInt16;
    @:native("Phentsize") var phentsize: go.UInt16;
    @:native("Phnum") var phnum: go.UInt16;
    @:native("Shentsize") var shentsize: go.UInt16;
    @:native("Shnum") var shnum: go.UInt16;
    @:native("Shstrndx") var shstrndx: go.UInt16;

function new(ident: go.GoArray<go.Byte, 16>, type: go.UInt16, machine: go.UInt16, version: go.UInt32, entry: go.UInt32, phoff: go.UInt32, shoff: go.UInt32, flags: go.UInt32, ehsize: go.UInt16, phentsize: go.UInt16, phnum: go.UInt16, shentsize: go.UInt16, shnum: go.UInt16, shstrndx: go.UInt16);

}