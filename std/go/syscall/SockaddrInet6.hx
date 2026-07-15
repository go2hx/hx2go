package go.syscall;

@:structInit
@:go.Type({ name: "SockaddrInet6", instanceName: "syscall.SockaddrInet6", imports: ["syscall"] })
extern class SockaddrInet6 {

    @:native("Port") var port: go.GoInt;
    @:native("ZoneId") var zoneId: go.UInt32;
    @:native("Addr") var addr: go.GoArray<go.Byte, 16>;

function new(port: go.GoInt, zoneId: go.UInt32, addr: go.GoArray<go.Byte, 16>);

}