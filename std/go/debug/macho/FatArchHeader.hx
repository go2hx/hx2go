package go.debug.macho;

/**
    A FatArchHeader represents a fat header for a specific image architecture.
**/
@:structInit
@:go.Type({ name: "FatArchHeader", instanceName: "macho.FatArchHeader", imports: ["debug/macho"] })
extern class FatArchHeader {

    @:native("Cpu") var cpu: go.debug.macho.Cpu;
    @:native("SubCpu") var subCpu: go.UInt32;
    @:native("Offset") var offset: go.UInt32;
    @:native("Size") var size: go.UInt32;
    @:native("Align") var align: go.UInt32;

    function new(cpu: go.debug.macho.Cpu=cast 0, subCpu: go.UInt32=0, offset: go.UInt32=0, size: go.UInt32=0, align: go.UInt32=0);

}