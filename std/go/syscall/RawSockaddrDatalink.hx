package go.syscall;

@:structInit
@:go.Type({ name: "RawSockaddrDatalink", instanceName: "syscall.RawSockaddrDatalink", imports: ["syscall"] })
extern class RawSockaddrDatalink {

    @:native("Len") var len: go.UInt8;
    @:native("Family") var family: go.UInt8;
    @:native("Index") var index: go.UInt16;
    @:native("Type") var type: go.UInt8;
    @:native("Nlen") var nlen: go.UInt8;
    @:native("Alen") var alen: go.UInt8;
    @:native("Slen") var slen: go.UInt8;
    @:native("Data") var data: go.GoArray<go.Int8, 12>;

    function new(len: go.UInt8, family: go.UInt8, index: go.UInt16, type: go.UInt8, nlen: go.UInt8, alen: go.UInt8, slen: go.UInt8, data: go.GoArray<go.Int8, 12>);

}