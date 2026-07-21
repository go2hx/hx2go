package go.syscall;

@:structInit
@:go.Type({ name: "IfmaMsghdr", instanceName: "syscall.IfmaMsghdr", imports: ["syscall"] })
extern class IfmaMsghdr {

    @:native("Msglen") var msglen: go.UInt16;
    @:native("Version") var version: go.UInt8;
    @:native("Type") var type: go.UInt8;
    @:native("Addrs") var addrs: go.Int32;
    @:native("Flags") var flags: go.Int32;
    @:native("Index") var index: go.UInt16;
    @:native("Pad_cgo_0") var pad_cgo_0: go.GoArray<go.Byte, 2>;

    function new(msglen: go.UInt16, version: go.UInt8, type: go.UInt8, addrs: go.Int32, flags: go.Int32, index: go.UInt16, pad_cgo_0: go.GoArray<go.Byte, 2>);

}