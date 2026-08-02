package go.net;

@:structInit
@:go.Type({ name: "rawListener", instanceName: "net.rawListener", imports: ["net"] })
extern class RawListener {

    @:native("Control") function control(f: (p0: go.UIntPtr) -> Void): (go.Error);
    @:native("Network") function network(): (Dynamic);
    @:native("PollFD") function pollFD(): (go.Pointer<Dynamic>);
    @:native("Read") function read(p0: (p0: go.UIntPtr) -> (Bool)): (go.Error);
    @:native("Write") function write(p0: (p0: go.UIntPtr) -> (Bool)): (go.Error);

}