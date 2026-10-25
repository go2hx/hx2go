package go.syscall;

@:structInit
@:go.Type({ name: "Filetime", instanceName: "syscall.Filetime", imports: ["syscall"] })
extern class Filetime {

    @:native("LowDateTime") var lowDateTime: go.UInt32;
    @:native("HighDateTime") var highDateTime: go.UInt32;

    function new(lowDateTime: go.UInt32=0, highDateTime: go.UInt32=0);

    /**
        Nanoseconds returns Filetime ft in nanoseconds
        since Epoch (00:00:00 UTC, January 1, 1970).
    **/
    @:native("Nanoseconds") function nanoseconds(): (go.Int64);

}