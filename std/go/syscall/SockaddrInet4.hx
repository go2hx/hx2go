package go.syscall;

@:structInit
@:go.Type({ name: "SockaddrInet4", instanceName: "syscall.SockaddrInet4", imports: ["syscall"] })
extern class SockaddrInet4 {

    @:native("Port") var port: go.GoInt;
    @:native("Addr") var addr: go.GoArray<go.Byte, 4>;

function new(port: go.GoInt, addr: go.GoArray<go.Byte, 4>);

}