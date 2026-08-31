package go.syscall;

@:structInit
@:go.Type({ name: "IfMsghdr", instanceName: "syscall.IfMsghdr", imports: ["syscall"] })
extern class IfMsghdr {

    @:native("Msglen") var msglen: go.UInt16;
    @:native("Version") var version: go.UInt8;
    @:native("Type") var type: go.UInt8;
    @:native("Addrs") var addrs: go.Int32;
    @:native("Flags") var flags: go.Int32;
    @:native("Index") var index: go.UInt16;
    @:native("Pad_cgo_0") var pad_cgo_0: go.GoArray<go.Byte, 2>;
    @:native("Data") var data: go.syscall.IfData;

    function new(msglen: go.UInt16=0, version: go.UInt8=0, type: go.UInt8=0, addrs: go.Int32=0, flags: go.Int32=0, index: go.UInt16=0, pad_cgo_0: go.GoArray<go.Byte, 2>, data: go.syscall.IfData);

}