package go.debug.pe;

@:structInit
@:go.Type({ name: "ImportDirectory", instanceName: "pe.ImportDirectory", imports: ["debug/pe"] })
extern class ImportDirectory {

    @:native("OriginalFirstThunk") var originalFirstThunk: go.UInt32;
    @:native("TimeDateStamp") var timeDateStamp: go.UInt32;
    @:native("ForwarderChain") var forwarderChain: go.UInt32;
    @:native("Name") var name: go.UInt32;
    @:native("FirstThunk") var firstThunk: go.UInt32;

function new(originalFirstThunk: go.UInt32, timeDateStamp: go.UInt32, forwarderChain: go.UInt32, name: go.UInt32, firstThunk: go.UInt32);

}