package go.syscall;

@:structInit
@:go.Type({ name: "Termios", instanceName: "syscall.Termios", imports: ["syscall"] })
extern class Termios {

    @:native("Iflag") var iflag: go.UInt64;
    @:native("Oflag") var oflag: go.UInt64;
    @:native("Cflag") var cflag: go.UInt64;
    @:native("Lflag") var lflag: go.UInt64;
    @:native("Cc") var cc: go.GoArray<go.UInt8, 20>;
    @:native("Pad_cgo_0") var pad_cgo_0: go.GoArray<go.Byte, 4>;
    @:native("Ispeed") var ispeed: go.UInt64;
    @:native("Ospeed") var ospeed: go.UInt64;

    function new(iflag: go.UInt64, oflag: go.UInt64, cflag: go.UInt64, lflag: go.UInt64, cc: go.GoArray<go.UInt8, 20>, pad_cgo_0: go.GoArray<go.Byte, 4>, ispeed: go.UInt64, ospeed: go.UInt64);

}