package go.syscall;

@:structInit
@:go.Type({ name: "Timespec", instanceName: "syscall.Timespec", imports: ["syscall"] })
extern class Timespec {

    @:native("Sec") var sec: go.Int64;
    @:native("Nsec") var nsec: go.Int64;

    function new(sec: go.Int64, nsec: go.Int64);

    @:native("Nano") function nano(): (go.Int64);
    @:go.Tuple("sec", "nsec") @:native("Unix") function unix(): (go.Tuple<{ sec: go.Int64, nsec: go.Int64 }>);

}