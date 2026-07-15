package go.syscall;

@:structInit
@:go.Type({ name: "IfInfomsg", instanceName: "syscall.IfInfomsg", imports: ["syscall"] })
extern class IfInfomsg {

    @:native("Family") var family: go.UInt8;
    @:native("X__ifi_pad") var x__ifi_pad: go.UInt8;
    @:native("Type") var type: go.UInt16;
    @:native("Index") var index: go.Int32;
    @:native("Flags") var flags: go.UInt32;
    @:native("Change") var change: go.UInt32;

function new(family: go.UInt8, x__ifi_pad: go.UInt8, type: go.UInt16, index: go.Int32, flags: go.UInt32, change: go.UInt32);

}