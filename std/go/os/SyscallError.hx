package go.os;

/**
    SyscallError records an error from a specific system call.
**/
@:structInit
@:go.Type({ name: "SyscallError", instanceName: "os.SyscallError", imports: ["os"] })
extern class SyscallError {

    @:native("Syscall") var syscall: String;
    @:native("Err") var err: go.Error;

    function new(syscall: String="", err: go.Error=null);

    @:native("Error") function error(): (String);
    /**
        Timeout reports whether this error represents a timeout.
    **/
    @:native("Timeout") function timeout(): (Bool);
    @:native("Unwrap") function unwrap(): (go.Error);

}