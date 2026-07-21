package go.syscall;

@:structInit
@:go.Type({ name: "Rlimit", instanceName: "syscall.Rlimit", imports: ["syscall"] })
extern class Rlimit {

    @:native("Cur") var cur: go.UInt64;
    @:native("Max") var max: go.UInt64;

    function new(cur: go.UInt64, max: go.UInt64);

}