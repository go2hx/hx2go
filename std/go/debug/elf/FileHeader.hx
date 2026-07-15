package go.debug.elf;

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

function new(_class: go.debug.elf.Class, data: go.debug.elf.Data, version: go.debug.elf.Version, OSABI: go.debug.elf.OSABI, aBIVersion: go.UInt8, byteOrder: go.encoding.binary.ByteOrder, type: go.debug.elf.Type, machine: go.debug.elf.Machine, entry: go.UInt64);

}