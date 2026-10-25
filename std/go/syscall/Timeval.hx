package go.syscall;

/**
    Invented values to support what package os expects.
**/
@:structInit
@:go.Type({ name: "Timeval", instanceName: "syscall.Timeval", imports: ["syscall"] })
extern class Timeval {

    @:native("Sec") var sec: go.Int32;
    @:native("Usec") var usec: go.Int32;

    function new(sec: go.Int32=0, usec: go.Int32=0);

    /**
        Nano returns the time stored in tv as nanoseconds.
    **/
    @:native("Nano") function nano(): (go.Int64);
    @:native("Nanoseconds") function nanoseconds(): (go.Int64);
    /**
        Unix returns the time stored in tv as seconds plus nanoseconds.
    **/
    @:go.Tuple("sec", "nsec") @:native("Unix") function unix(): (go.Tuple<{ sec: go.Int64, nsec: go.Int64 }>);

}