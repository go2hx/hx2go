package go.net;

@:structInit
@:go.Type({ name: "rawConn", instanceName: "net.rawConn", imports: ["net"] })
extern class RawConn {

    @:native("Control") function control(f: (p0: go.UIntPtr) -> Void): (go.Error);
    @:native("Network") function network(): (Dynamic);
    @:native("PollFD") function pollFD(): (go.Pointer<Dynamic>);
    @:native("Read") function read(f: (p0: go.UIntPtr) -> (Bool)): (go.Error);
    @:native("Write") function write(f: (p0: go.UIntPtr) -> (Bool)): (go.Error);

}