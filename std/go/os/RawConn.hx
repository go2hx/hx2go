package go.os;

@:structInit
@:go.Type({ name: "rawConn", instanceName: "os.rawConn", imports: ["os"] })
extern class RawConn {

    @:native("Control") function control(f: (p0: go.UIntPtr) -> Void): (go.Error);
    @:native("Read") function read(f: (p0: go.UIntPtr) -> (Bool)): (go.Error);
    @:native("Write") function write(f: (p0: go.UIntPtr) -> (Bool)): (go.Error);

}