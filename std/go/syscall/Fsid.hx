package go.syscall;

@:structInit
@:go.Type({ name: "Fsid", instanceName: "syscall.Fsid", imports: ["syscall"] })
extern class Fsid {

    @:native("X__val") var x__val: go.GoArray<go.Int32, 2>;

function new(x__val: go.GoArray<go.Int32, 2>);

}