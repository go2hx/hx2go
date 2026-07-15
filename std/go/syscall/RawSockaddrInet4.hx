package go.syscall;

@:structInit
@:go.Type({ name: "RawSockaddrInet4", instanceName: "syscall.RawSockaddrInet4", imports: ["syscall"] })
extern class RawSockaddrInet4 {

    @:native("Family") var family: go.UInt16;
    @:native("Port") var port: go.UInt16;
    @:native("Addr") var addr: go.GoArray<go.Byte, 4>;
    @:native("Zero") var zero: go.GoArray<go.UInt8, 8>;

function new(family: go.UInt16, port: go.UInt16, addr: go.GoArray<go.Byte, 4>, zero: go.GoArray<go.UInt8, 8>);

}