package go.syscall;

@:structInit
@:go.Type({ name: "Iovec", instanceName: "syscall.Iovec", imports: ["syscall"] })
extern class Iovec {

    @:native("Base") var base: go.Pointer<go.Byte>;
    @:native("Len") var len: go.UInt64;

function new(base: go.Pointer<go.Byte>, len: go.UInt64);

    @:native("SetLen") function setLen(length: go.GoInt): Void;

}