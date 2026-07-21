package go.syscall;

@:structInit
@:go.Type({ name: "RawSockaddr", instanceName: "syscall.RawSockaddr", imports: ["syscall"] })
extern class RawSockaddr {

    @:native("Len") var len: go.UInt8;
    @:native("Family") var family: go.UInt8;
    @:native("Data") var data: go.GoArray<go.Int8, 14>;

    function new(len: go.UInt8, family: go.UInt8, data: go.GoArray<go.Int8, 14>);

}