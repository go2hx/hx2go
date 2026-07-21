package go.syscall;

@:structInit
@:go.Type({ name: "RawSockaddrUnix", instanceName: "syscall.RawSockaddrUnix", imports: ["syscall"] })
extern class RawSockaddrUnix {

    @:native("Len") var len: go.UInt8;
    @:native("Family") var family: go.UInt8;
    @:native("Path") var path: go.GoArray<go.Int8, 104>;

    function new(len: go.UInt8, family: go.UInt8, path: go.GoArray<go.Int8, 104>);

}