package go.syscall;

@:structInit
@:go.Type({ name: "Timeval", instanceName: "syscall.Timeval", imports: ["syscall"] })
extern class Timeval {

    @:native("Sec") var sec: go.Int64;
    @:native("Usec") var usec: go.Int32;
    @:native("Pad_cgo_0") var pad_cgo_0: go.GoArray<go.Byte, 4>;

    function new(sec: go.Int64, usec: go.Int32, pad_cgo_0: go.GoArray<go.Byte, 4>);

    @:native("Nano") function nano(): (go.Int64);
    @:go.Tuple("sec", "nsec") @:native("Unix") function unix(): (go.Tuple<{ sec: go.Int64, nsec: go.Int64 }>);

}