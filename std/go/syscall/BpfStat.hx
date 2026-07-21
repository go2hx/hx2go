package go.syscall;

@:structInit
@:go.Type({ name: "BpfStat", instanceName: "syscall.BpfStat", imports: ["syscall"] })
extern class BpfStat {

    @:native("Recv") var recv: go.UInt32;
    @:native("Drop") var drop: go.UInt32;

    function new(recv: go.UInt32, drop: go.UInt32);

}