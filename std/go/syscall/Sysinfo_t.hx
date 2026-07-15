package go.syscall;

@:structInit
@:go.Type({ name: "Sysinfo_t", instanceName: "syscall.Sysinfo_t", imports: ["syscall"] })
extern class Sysinfo_t {

    @:native("Uptime") var uptime: go.Int64;
    @:native("Loads") var loads: go.GoArray<go.UInt64, 3>;
    @:native("Totalram") var totalram: go.UInt64;
    @:native("Freeram") var freeram: go.UInt64;
    @:native("Sharedram") var sharedram: go.UInt64;
    @:native("Bufferram") var bufferram: go.UInt64;
    @:native("Totalswap") var totalswap: go.UInt64;
    @:native("Freeswap") var freeswap: go.UInt64;
    @:native("Procs") var procs: go.UInt16;
    @:native("Pad") var pad: go.UInt16;
    @:native("Pad_cgo_0") var pad_cgo_0: go.GoArray<go.Byte, 4>;
    @:native("Totalhigh") var totalhigh: go.UInt64;
    @:native("Freehigh") var freehigh: go.UInt64;
    @:native("Unit") var unit: go.UInt32;
    @:native("X_f") var x_f: go.GoArray<go.Byte, 0>;
    @:native("Pad_cgo_1") var pad_cgo_1: go.GoArray<go.Byte, 4>;

function new(uptime: go.Int64, loads: go.GoArray<go.UInt64, 3>, totalram: go.UInt64, freeram: go.UInt64, sharedram: go.UInt64, bufferram: go.UInt64, totalswap: go.UInt64, freeswap: go.UInt64, procs: go.UInt16, pad: go.UInt16, pad_cgo_0: go.GoArray<go.Byte, 4>, totalhigh: go.UInt64, freehigh: go.UInt64, unit: go.UInt32, x_f: go.GoArray<go.Byte, 0>, pad_cgo_1: go.GoArray<go.Byte, 4>);

}