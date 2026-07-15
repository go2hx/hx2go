package go.syscall;

@:structInit
@:go.Type({ name: "EpollEvent", instanceName: "syscall.EpollEvent", imports: ["syscall"] })
extern class EpollEvent {

    @:native("Events") var events: go.UInt32;
    @:native("Fd") var fd: go.Int32;
    @:native("Pad") var pad: go.Int32;

function new(events: go.UInt32, fd: go.Int32, pad: go.Int32);

}