package go.syscall;

@:structInit
@:go.Type({ name: "DNSSRVData", instanceName: "syscall.DNSSRVData", imports: ["syscall"] })
extern class DNSSRVData {

    @:native("Target") var target: go.Pointer<go.UInt16>;
    @:native("Priority") var priority: go.UInt16;
    @:native("Weight") var weight: go.UInt16;
    @:native("Port") var port: go.UInt16;
    @:native("Pad") var pad: go.UInt16;

    function new(target: go.Pointer<go.UInt16>=null, priority: go.UInt16=0, weight: go.UInt16=0, port: go.UInt16=0, pad: go.UInt16=0);

}