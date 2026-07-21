package go.syscall;

@:structInit
@:go.Type({ name: "FdSet", instanceName: "syscall.FdSet", imports: ["syscall"] })
extern class FdSet {

    @:native("Bits") var bits: go.GoArray<go.Int32, 32>;

    function new(bits: go.GoArray<go.Int32, 32>);

}