package go.syscall;

@:structInit
@:go.Type({ name: "RawSockaddrAny", instanceName: "syscall.RawSockaddrAny", imports: ["syscall"] })
extern class RawSockaddrAny {

    @:native("Addr") var addr: go.syscall.RawSockaddr;
    @:native("Pad") var pad: go.GoArray<go.Int8, 96>;

function new(addr: go.syscall.RawSockaddr, pad: go.GoArray<go.Int8, 96>);

}