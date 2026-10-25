package go.syscall;

/**
    Invented structures to support what package os expects.
**/
@:structInit
@:go.Type({ name: "Rusage", instanceName: "syscall.Rusage", imports: ["syscall"] })
extern class Rusage {

    @:native("CreationTime") var creationTime: go.syscall.Filetime;
    @:native("ExitTime") var exitTime: go.syscall.Filetime;
    @:native("KernelTime") var kernelTime: go.syscall.Filetime;
    @:native("UserTime") var userTime: go.syscall.Filetime;

    function new(creationTime: go.syscall.Filetime, exitTime: go.syscall.Filetime, kernelTime: go.syscall.Filetime, userTime: go.syscall.Filetime);

}