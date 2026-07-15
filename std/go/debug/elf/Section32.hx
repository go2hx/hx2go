package go.debug.elf;

@:structInit
@:go.Type({ name: "Section32", instanceName: "elf.Section32", imports: ["debug/elf"] })
extern class Section32 {

    @:native("Name") var name: go.UInt32;
    @:native("Type") var type: go.UInt32;
    @:native("Flags") var flags: go.UInt32;
    @:native("Addr") var addr: go.UInt32;
    @:native("Off") var off: go.UInt32;
    @:native("Size") var size: go.UInt32;
    @:native("Link") var link: go.UInt32;
    @:native("Info") var info: go.UInt32;
    @:native("Addralign") var addralign: go.UInt32;
    @:native("Entsize") var entsize: go.UInt32;

function new(name: go.UInt32, type: go.UInt32, flags: go.UInt32, addr: go.UInt32, off: go.UInt32, size: go.UInt32, link: go.UInt32, info: go.UInt32, addralign: go.UInt32, entsize: go.UInt32);

}