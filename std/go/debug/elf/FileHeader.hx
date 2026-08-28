package go.debug.elf;

/**
    A FileHeader represents an ELF file header.
**/
@:structInit
@:go.Type({ name: "FileHeader", instanceName: "elf.FileHeader", imports: ["debug/elf"] })
extern class FileHeader {

    @:native("Class") var _class: go.debug.elf.Class;
    @:native("Data") var data: go.debug.elf.Data;
    @:native("Version") var version: go.debug.elf.Version;
    @:native("OSABI") var OSABI: go.debug.elf.OSABI;
    @:native("ABIVersion") var aBIVersion: go.UInt8;
    @:native("ByteOrder") var byteOrder: go.encoding.binary.ByteOrder;
    @:native("Type") var type: go.debug.elf.Type;
    @:native("Machine") var machine: go.debug.elf.Machine;
    @:native("Entry") var entry: go.UInt64;

    function new(_class: go.debug.elf.Class=cast 0, data: go.debug.elf.Data=cast 0, version: go.debug.elf.Version=cast 0, OSABI: go.debug.elf.OSABI=cast 0, aBIVersion: go.UInt8=0, byteOrder: go.encoding.binary.ByteOrder=null, type: go.debug.elf.Type=cast 0, machine: go.debug.elf.Machine=cast 0, entry: go.UInt64=0);

}