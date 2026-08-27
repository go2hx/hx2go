package go.syscall;

@:structInit
@:go.Type({ name: "Msghdr", instanceName: "syscall.Msghdr", imports: ["syscall"] })
extern class Msghdr {

    @:native("Name") var name: go.Pointer<go.Byte>;
    @:native("Namelen") var namelen: go.UInt32;
    @:native("Pad_cgo_0") var pad_cgo_0: go.GoArray<go.Byte, 4>;
    @:native("Iov") var iov: go.Pointer<go.syscall.Iovec>;
    @:native("Iovlen") var iovlen: go.Int32;
    @:native("Pad_cgo_1") var pad_cgo_1: go.GoArray<go.Byte, 4>;
    @:native("Control") var control: go.Pointer<go.Byte>;
    @:native("Controllen") var controllen: go.UInt32;
    @:native("Flags") var flags: go.Int32;

    function new(name: go.Pointer<go.Byte>=null, namelen: go.UInt32=0, pad_cgo_0: go.GoArray<go.Byte, 4>, iov: go.Pointer<go.syscall.Iovec>=null, iovlen: go.Int32=0, pad_cgo_1: go.GoArray<go.Byte, 4>, control: go.Pointer<go.Byte>=null, controllen: go.UInt32=0, flags: go.Int32=0);

    @:native("SetControllen") function setControllen(length: go.GoInt): Void;

}