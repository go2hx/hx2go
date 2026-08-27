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

    function new(name: String="", type: go.debug.elf.SectionType=cast 0, flags: go.debug.elf.SectionFlag=cast 0, addr: go.UInt64=0, offset: go.UInt64=0, size: go.UInt64=0, link: go.UInt32=0, info: go.UInt32=0, addralign: go.UInt64=0, entsize: go.UInt64=0, fileSize: go.UInt64=0);

}