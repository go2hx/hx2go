package go.syscall;

@:structInit
@:go.Type({ name: "Dirent", instanceName: "syscall.Dirent", imports: ["syscall"] })
extern class Dirent {

    @:native("Ino") var ino: go.UInt64;
    @:native("Seekoff") var seekoff: go.UInt64;
    @:native("Reclen") var reclen: go.UInt16;
    @:native("Namlen") var namlen: go.UInt16;
    @:native("Type") var type: go.UInt8;
    @:native("Name") var name: go.GoArray<go.Int8, 1024>;
    @:native("Pad_cgo_0") var pad_cgo_0: go.GoArray<go.Byte, 3>;

    function new(ino: go.UInt64, seekoff: go.UInt64, reclen: go.UInt16, namlen: go.UInt16, type: go.UInt8, name: go.GoArray<go.Int8, 1024>, pad_cgo_0: go.GoArray<go.Byte, 3>);

}