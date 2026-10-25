package go.syscall;

@:structInit
@:go.Type({ name: "Overlapped", instanceName: "syscall.Overlapped", imports: ["syscall"] })
extern class Overlapped {

    @:native("Internal") var internal: go.UIntPtr;
    @:native("InternalHigh") var internalHigh: go.UIntPtr;
    @:native("Offset") var offset: go.UInt32;
    @:native("OffsetHigh") var offsetHigh: go.UInt32;
    @:native("HEvent") var hEvent: go.syscall.Handle;

    function new(internal: go.UIntPtr=0, internalHigh: go.UIntPtr=0, offset: go.UInt32=0, offsetHigh: go.UInt32=0, hEvent: go.syscall.Handle=cast 0);

}