package go.syscall;

@:structInit
@:go.Type({ name: "Rusage", instanceName: "syscall.Rusage", imports: ["syscall"] })
extern class Rusage {

    @:native("Utime") var utime: go.syscall.Timeval;
    @:native("Stime") var stime: go.syscall.Timeval;
    @:native("Maxrss") var maxrss: go.Int64;
    @:native("Ixrss") var ixrss: go.Int64;
    @:native("Idrss") var idrss: go.Int64;
    @:native("Isrss") var isrss: go.Int64;
    @:native("Minflt") var minflt: go.Int64;
    @:native("Majflt") var majflt: go.Int64;
    @:native("Nswap") var nswap: go.Int64;
    @:native("Inblock") var inblock: go.Int64;
    @:native("Oublock") var oublock: go.Int64;
    @:native("Msgsnd") var msgsnd: go.Int64;
    @:native("Msgrcv") var msgrcv: go.Int64;
    @:native("Nsignals") var nsignals: go.Int64;
    @:native("Nvcsw") var nvcsw: go.Int64;
    @:native("Nivcsw") var nivcsw: go.Int64;

    function new(utime: go.syscall.Timeval, stime: go.syscall.Timeval, maxrss: go.Int64, ixrss: go.Int64, idrss: go.Int64, isrss: go.Int64, minflt: go.Int64, majflt: go.Int64, nswap: go.Int64, inblock: go.Int64, oublock: go.Int64, msgsnd: go.Int64, msgrcv: go.Int64, nsignals: go.Int64, nvcsw: go.Int64, nivcsw: go.Int64);

}