package go.syscall;

@:structInit
@:go.Type({ name: "RawSockaddrInet6", instanceName: "syscall.RawSockaddrInet6", imports: ["syscall"] })
extern class RawSockaddrInet6 {

    @:native("Family") var family: go.UInt16;
    @:native("Port") var port: go.UInt16;
    @:native("Flowinfo") var flowinfo: go.UInt32;
    @:native("Addr") var addr: go.GoArray<go.Byte, 16>;
    @:native("Scope_id") var scope_id: go.UInt32;

function new(family: go.UInt16, port: go.UInt16, flowinfo: go.UInt32, addr: go.GoArray<go.Byte, 16>, scope_id: go.UInt32);

}