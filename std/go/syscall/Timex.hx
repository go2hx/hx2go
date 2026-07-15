package go.syscall;

@:structInit
@:go.Type({ name: "Timex", instanceName: "syscall.Timex", imports: ["syscall"] })
extern class Timex {

    @:native("Modes") var modes: go.UInt32;
    @:native("Pad_cgo_0") var pad_cgo_0: go.GoArray<go.Byte, 4>;
    @:native("Offset") var offset: go.Int64;
    @:native("Freq") var freq: go.Int64;
    @:native("Maxerror") var maxerror: go.Int64;
    @:native("Esterror") var esterror: go.Int64;
    @:native("Status") var status: go.Int32;
    @:native("Pad_cgo_1") var pad_cgo_1: go.GoArray<go.Byte, 4>;
    @:native("Constant") var constant: go.Int64;
    @:native("Precision") var precision: go.Int64;
    @:native("Tolerance") var tolerance: go.Int64;
    @:native("Time") var time: go.syscall.Timeval;
    @:native("Tick") var tick: go.Int64;
    @:native("Ppsfreq") var ppsfreq: go.Int64;
    @:native("Jitter") var jitter: go.Int64;
    @:native("Shift") var shift: go.Int32;
    @:native("Pad_cgo_2") var pad_cgo_2: go.GoArray<go.Byte, 4>;
    @:native("Stabil") var stabil: go.Int64;
    @:native("Jitcnt") var jitcnt: go.Int64;
    @:native("Calcnt") var calcnt: go.Int64;
    @:native("Errcnt") var errcnt: go.Int64;
    @:native("Stbcnt") var stbcnt: go.Int64;
    @:native("Tai") var tai: go.Int32;
    @:native("Pad_cgo_3") var pad_cgo_3: go.GoArray<go.Byte, 44>;

function new(modes: go.UInt32, pad_cgo_0: go.GoArray<go.Byte, 4>, offset: go.Int64, freq: go.Int64, maxerror: go.Int64, esterror: go.Int64, status: go.Int32, pad_cgo_1: go.GoArray<go.Byte, 4>, constant: go.Int64, precision: go.Int64, tolerance: go.Int64, time: go.syscall.Timeval, tick: go.Int64, ppsfreq: go.Int64, jitter: go.Int64, shift: go.Int32, pad_cgo_2: go.GoArray<go.Byte, 4>, stabil: go.Int64, jitcnt: go.Int64, calcnt: go.Int64, errcnt: go.Int64, stbcnt: go.Int64, tai: go.Int32, pad_cgo_3: go.GoArray<go.Byte, 44>);

}