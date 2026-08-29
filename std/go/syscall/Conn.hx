package go.syscall;

/**
    Conn is implemented by some types in the net and os packages to provide
    access to the underlying file descriptor or handle.
**/
@:go.Type({ name: "Conn", instanceName: "syscall.Conn", imports: ["syscall"] })
extern typedef Conn = {

    @:native("SyscallConn") function syscallConn(): (go.Result<go.syscall.RawConn>);

}