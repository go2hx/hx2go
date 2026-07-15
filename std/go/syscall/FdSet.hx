package go.syscall;

@:structInit
@:go.Type({ name: "FdSet", instanceName: "syscall.FdSet", imports: ["syscall"] })
extern class FdSet {

    @:native("Bits") var bits: go.GoArray<go.Int64, 16>;

function new(bits: go.GoArray<go.Int64, 16>);

}