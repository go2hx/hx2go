package go.syscall;

@:structInit
@:go.Type({ name: "Dirent", instanceName: "syscall.Dirent", imports: ["syscall"] })
extern class Dirent {

    @:native("Ino") var ino: go.UInt64;
    @:native("Off") var off: go.Int64;
    @:native("Reclen") var reclen: go.UInt16;
    @:native("Type") var type: go.UInt8;
    @:native("Name") var name: go.GoArray<go.Int8, 256>;
    @:native("Pad_cgo_0") var pad_cgo_0: go.GoArray<go.Byte, 5>;

function new(ino: go.UInt64, off: go.Int64, reclen: go.UInt16, type: go.UInt8, name: go.GoArray<go.Int8, 256>, pad_cgo_0: go.GoArray<go.Byte, 5>);

}