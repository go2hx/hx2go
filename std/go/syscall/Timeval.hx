package go.syscall;

@:structInit
@:go.Type({ name: "Timeval", instanceName: "syscall.Timeval", imports: ["syscall"] })
extern class Timeval {

    @:native("Sec") var sec: go.Int64;
    @:native("Usec") var usec: go.Int64;

function new(sec: go.Int64, usec: go.Int64);

    @:native("Nano") function nano(): go.Int64;
    @:go.Tuple("sec", "nsec") @:native("Unix") function unix(): go.Tuple<{ sec: go.Int64, nsec: go.Int64 }>;

}