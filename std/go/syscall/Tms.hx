package go.syscall;

@:structInit
@:go.Type({ name: "Tms", instanceName: "syscall.Tms", imports: ["syscall"] })
extern class Tms {

    @:native("Utime") var utime: go.Int64;
    @:native("Stime") var stime: go.Int64;
    @:native("Cutime") var cutime: go.Int64;
    @:native("Cstime") var cstime: go.Int64;

function new(utime: go.Int64, stime: go.Int64, cutime: go.Int64, cstime: go.Int64);

}