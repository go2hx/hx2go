package go.net;

@:structInit
@:go.Type({ name: "Interface", instanceName: "net.Interface", imports: ["net"] })
extern class Interface {

    @:native("Index") var index: go.GoInt;
    @:native("MTU") var MTU: go.GoInt;
    @:native("Name") var name: String;
    @:native("HardwareAddr") var hardwareAddr: go.net.HardwareAddr;
    @:native("Flags") var flags: go.net.Flags;

    function new(index: go.GoInt=0, MTU: go.GoInt=0, name: String="", hardwareAddr: go.net.HardwareAddr=null, flags: go.net.Flags=cast 0);

    @:native("Addrs") function addrs(): (go.Result<go.Slice<go.net.Addr>>);
    @:native("MulticastAddrs") function multicastAddrs(): (go.Result<go.Slice<go.net.Addr>>);

}