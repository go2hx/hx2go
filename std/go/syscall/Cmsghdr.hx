package go.syscall;

@:structInit
@:go.Type({ name: "Cmsghdr", instanceName: "syscall.Cmsghdr", imports: ["syscall"] })
extern class Cmsghdr {

    @:native("Len") var len: go.UInt64;
    @:native("Level") var level: go.Int32;
    @:native("Type") var type: go.Int32;

function new(len: go.UInt64, level: go.Int32, type: go.Int32);

    @:native("SetLen") function setLen(length: go.GoInt): Void;

}