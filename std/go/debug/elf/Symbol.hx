package go.debug.elf;

@:structInit
@:go.Type({ name: "Symbol", instanceName: "elf.Symbol", imports: ["debug/elf"] })
extern class Symbol {

    @:native("Name") var name: String;
    @:native("Info") var info: go.Byte;
    @:native("Other") var other: go.Byte;
    @:native("HasVersion") var hasVersion: Bool;
    @:native("VersionIndex") var versionIndex: go.debug.elf.VersionIndex;
    @:native("Section") var section: go.debug.elf.SectionIndex;
    @:native("Value") var value: go.UInt64;
    @:native("Size") var size: go.UInt64;
    @:native("Version") var version: String;
    @:native("Library") var library: String;

    function new(name: String="", info: go.Byte=0, other: go.Byte=0, hasVersion: Bool=false, versionIndex: go.debug.elf.VersionIndex=cast 0, section: go.debug.elf.SectionIndex=cast 0, value: go.UInt64=0, size: go.UInt64=0, version: String="", library: String="");

}