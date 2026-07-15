package go.syscall;

@:structInit
@:go.Type({ name: "Termios", instanceName: "syscall.Termios", imports: ["syscall"] })
extern class Termios {

    @:native("Iflag") var iflag: go.UInt32;
    @:native("Oflag") var oflag: go.UInt32;
    @:native("Cflag") var cflag: go.UInt32;
    @:native("Lflag") var lflag: go.UInt32;
    @:native("Line") var line: go.UInt8;
    @:native("Cc") var cc: go.GoArray<go.UInt8, 32>;
    @:native("Pad_cgo_0") var pad_cgo_0: go.GoArray<go.Byte, 3>;
    @:native("Ispeed") var ispeed: go.UInt32;
    @:native("Ospeed") var ospeed: go.UInt32;

function new(iflag: go.UInt32, oflag: go.UInt32, cflag: go.UInt32, lflag: go.UInt32, line: go.UInt8, cc: go.GoArray<go.UInt8, 32>, pad_cgo_0: go.GoArray<go.Byte, 3>, ispeed: go.UInt32, ospeed: go.UInt32);

}