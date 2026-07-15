package go.syscall;

@:go.Type({ name: "RawConn", instanceName: "syscall.RawConn", imports: ["syscall"] })
extern typedef RawConn = {

    @:native("Control") function control(f: (fd: go.UIntPtr) -> Void): go.Error;
    @:native("Read") function read(f: (fd: go.UIntPtr) -> Bool): go.Error;
    @:native("Write") function write(f: (fd: go.UIntPtr) -> Bool): go.Error;

}