package go.debug.elf;

@:structInit
@:go.Type({ name: "Section64", instanceName: "elf.Section64", imports: ["debug/elf"] })
extern class Section64 {

    @:native("Name") var name: go.UInt32;
    @:native("Type") var type: go.UInt32;
    @:native("Flags") var flags: go.UInt64;
    @:native("Addr") var addr: go.UInt64;
    @:native("Off") var off: go.UInt64;
    @:native("Size") var size: go.UInt64;
    @:native("Link") var link: go.UInt32;
    @:native("Info") var info: go.UInt32;
    @:native("Addralign") var addralign: go.UInt64;
    @:native("Entsize") var entsize: go.UInt64;

function new(name: go.UInt32, type: go.UInt32, flags: go.UInt64, addr: go.UInt64, off: go.UInt64, size: go.UInt64, link: go.UInt32, info: go.UInt32, addralign: go.UInt64, entsize: go.UInt64);

}