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

function new(name: String, info: go.Byte, other: go.Byte, hasVersion: Bool, versionIndex: go.debug.elf.VersionIndex, section: go.debug.elf.SectionIndex, value: go.UInt64, size: go.UInt64, version: String, library: String);

}