package go.debug.pe;

@:structInit
@:go.Type({ name: "DataDirectory", instanceName: "pe.DataDirectory", imports: ["debug/pe"] })
extern class DataDirectory {

    @:native("VirtualAddress") var virtualAddress: go.UInt32;
    @:native("Size") var size: go.UInt32;

function new(virtualAddress: go.UInt32, size: go.UInt32);

}