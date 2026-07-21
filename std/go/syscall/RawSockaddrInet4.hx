package go.syscall;

@:structInit
@:go.Type({ name: "RawSockaddrInet4", instanceName: "syscall.RawSockaddrInet4", imports: ["syscall"] })
extern class RawSockaddrInet4 {

    @:native("Len") var len: go.UInt8;
    @:native("Family") var family: go.UInt8;
    @:native("Port") var port: go.UInt16;
    @:native("Addr") var addr: go.GoArray<go.Byte, 4>;
    @:native("Zero") var zero: go.GoArray<go.Int8, 8>;

    function new(len: go.UInt8, family: go.UInt8, port: go.UInt16, addr: go.GoArray<go.Byte, 4>, zero: go.GoArray<go.Int8, 8>);

}