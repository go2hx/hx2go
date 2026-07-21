package go.syscall;

@:structInit
@:go.Type({ name: "Radvisory_t", instanceName: "syscall.Radvisory_t", imports: ["syscall"] })
extern class Radvisory_t {

    @:native("Offset") var offset: go.Int64;
    @:native("Count") var count: go.Int32;
    @:native("Pad_cgo_0") var pad_cgo_0: go.GoArray<go.Byte, 4>;

    function new(offset: go.Int64, count: go.Int32, pad_cgo_0: go.GoArray<go.Byte, 4>);

}