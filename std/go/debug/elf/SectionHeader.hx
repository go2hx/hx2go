package go.debug.elf;

@:structInit
@:go.Type({ name: "SectionHeader", instanceName: "elf.SectionHeader", imports: ["debug/elf"] })
extern class SectionHeader {

    @:native("Name") var name: String;
    @:native("Type") var type: go.debug.elf.SectionType;
    @:native("Flags") var flags: go.debug.elf.SectionFlag;
    @:native("Addr") var addr: go.UInt64;
    @:native("Offset") var offset: go.UInt64;
    @:native("Size") var size: go.UInt64;
    @:native("Link") var link: go.UInt32;
    @:native("Info") var info: go.UInt32;
    @:native("Addralign") var addralign: go.UInt64;
    @:native("Entsize") var entsize: go.UInt64;
    @:native("FileSize") var fileSize: go.UInt64;

function new(name: String, type: go.debug.elf.SectionType, flags: go.debug.elf.SectionFlag, addr: go.UInt64, offset: go.UInt64, size: go.UInt64, link: go.UInt32, info: go.UInt32, addralign: go.UInt64, entsize: go.UInt64, fileSize: go.UInt64);

}