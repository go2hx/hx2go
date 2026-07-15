package go.syscall;

@:structInit
@:go.Type({ name: "Ustat_t", instanceName: "syscall.Ustat_t", imports: ["syscall"] })
extern class Ustat_t {

    @:native("Tfree") var tfree: go.Int32;
    @:native("Pad_cgo_0") var pad_cgo_0: go.GoArray<go.Byte, 4>;
    @:native("Tinode") var tinode: go.UInt64;
    @:native("Fname") var fname: go.GoArray<go.Int8, 6>;
    @:native("Fpack") var fpack: go.GoArray<go.Int8, 6>;
    @:native("Pad_cgo_1") var pad_cgo_1: go.GoArray<go.Byte, 4>;

function new(tfree: go.Int32, pad_cgo_0: go.GoArray<go.Byte, 4>, tinode: go.UInt64, fname: go.GoArray<go.Int8, 6>, fpack: go.GoArray<go.Int8, 6>, pad_cgo_1: go.GoArray<go.Byte, 4>);

}