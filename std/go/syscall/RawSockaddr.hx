package go.syscall;

@:structInit
@:go.Type({ name: "RawSockaddr", instanceName: "syscall.RawSockaddr", imports: ["syscall"] })
extern class RawSockaddr {

    @:native("Family") var family: go.UInt16;
    @:native("Data") var data: go.GoArray<go.Int8, 14>;

function new(family: go.UInt16, data: go.GoArray<go.Int8, 14>);

}