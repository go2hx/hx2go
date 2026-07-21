package go.syscall;

@:structInit
@:go.Type({ name: "BpfVersion", instanceName: "syscall.BpfVersion", imports: ["syscall"] })
extern class BpfVersion {

    @:native("Major") var major: go.UInt16;
    @:native("Minor") var minor: go.UInt16;

    function new(major: go.UInt16, minor: go.UInt16);

}