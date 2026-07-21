package go.syscall;

@:structInit
@:go.Type({ name: "Fsid", instanceName: "syscall.Fsid", imports: ["syscall"] })
extern class Fsid {

    @:native("Val") var val: go.GoArray<go.Int32, 2>;

    function new(val: go.GoArray<go.Int32, 2>);

}