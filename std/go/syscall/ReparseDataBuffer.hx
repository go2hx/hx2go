package go.syscall;

@:structInit
@:go.Type({ name: "reparseDataBuffer", instanceName: "syscall.reparseDataBuffer", imports: ["syscall"] })
extern class ReparseDataBuffer {

    @:native("ReparseTag") var reparseTag: go.UInt32;
    @:native("ReparseDataLength") var reparseDataLength: go.UInt16;
    @:native("Reserved") var reserved: go.UInt16;

    function new(reparseTag: go.UInt32=0, reparseDataLength: go.UInt16=0, reserved: go.UInt16=0);

}