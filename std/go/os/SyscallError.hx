package go.os;

@:structInit
@:go.Type({ name: "SyscallError", instanceName: "os.SyscallError", imports: ["os"] })
extern class SyscallError {

    @:native("Syscall") var syscall: String;
    @:native("Err") var err: go.Error;

function new(syscall: String, err: go.Error);

    @:native("Error") function error(): String;
    @:native("Timeout") function timeout(): Bool;
    @:native("Unwrap") function unwrap(): go.Error;

}