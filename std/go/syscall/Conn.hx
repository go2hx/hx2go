package go.syscall;

@:go.Type({ name: "Conn", instanceName: "syscall.Conn", imports: ["syscall"] })
extern typedef Conn = {

    @:native("SyscallConn") function syscallConn(): go.Result<go.syscall.RawConn>;

}