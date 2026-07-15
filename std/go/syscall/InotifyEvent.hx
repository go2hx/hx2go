package go.syscall;

@:structInit
@:go.Type({ name: "InotifyEvent", instanceName: "syscall.InotifyEvent", imports: ["syscall"] })
extern class InotifyEvent {

    @:native("Wd") var wd: go.Int32;
    @:native("Mask") var mask: go.UInt32;
    @:native("Cookie") var cookie: go.UInt32;
    @:native("Len") var len: go.UInt32;
    @:native("Name") var name: go.GoArray<go.UInt8, 0>;

function new(wd: go.Int32, mask: go.UInt32, cookie: go.UInt32, len: go.UInt32, name: go.GoArray<go.UInt8, 0>);

}