package go.syscall;

@:structInit
@:go.Type({ name: "Timeval32", instanceName: "syscall.Timeval32", imports: ["syscall"] })
extern class Timeval32 {

    @:native("Sec") var sec: go.Int32;
    @:native("Usec") var usec: go.Int32;

    function new(sec: go.Int32, usec: go.Int32);

}