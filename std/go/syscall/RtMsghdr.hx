package go.syscall;

@:structInit
@:go.Type({ name: "RtMsghdr", instanceName: "syscall.RtMsghdr", imports: ["syscall"] })
extern class RtMsghdr {

    @:native("Msglen") var msglen: go.UInt16;
    @:native("Version") var version: go.UInt8;
    @:native("Type") var type: go.UInt8;
    @:native("Index") var index: go.UInt16;
    @:native("Pad_cgo_0") var pad_cgo_0: go.GoArray<go.Byte, 2>;
    @:native("Flags") var flags: go.Int32;
    @:native("Addrs") var addrs: go.Int32;
    @:native("Pid") var pid: go.Int32;
    @:native("Seq") var seq: go.Int32;
    @:native("Errno") var errno: go.Int32;
    @:native("Use") var use: go.Int32;
    @:native("Inits") var inits: go.UInt32;
    @:native("Rmx") var rmx: go.syscall.RtMetrics;

    function new(msglen: go.UInt16, version: go.UInt8, type: go.UInt8, index: go.UInt16, pad_cgo_0: go.GoArray<go.Byte, 2>, flags: go.Int32, addrs: go.Int32, pid: go.Int32, seq: go.Int32, errno: go.Int32, use: go.Int32, inits: go.UInt32, rmx: go.syscall.RtMetrics);

}