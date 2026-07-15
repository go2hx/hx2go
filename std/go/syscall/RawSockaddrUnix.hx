package go.syscall;

@:structInit
@:go.Type({ name: "RawSockaddrUnix", instanceName: "syscall.RawSockaddrUnix", imports: ["syscall"] })
extern class RawSockaddrUnix {

    @:native("Family") var family: go.UInt16;
    @:native("Path") var path: go.GoArray<go.Int8, 108>;

function new(family: go.UInt16, path: go.GoArray<go.Int8, 108>);

}