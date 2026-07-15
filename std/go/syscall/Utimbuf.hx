package go.syscall;

@:structInit
@:go.Type({ name: "Utimbuf", instanceName: "syscall.Utimbuf", imports: ["syscall"] })
extern class Utimbuf {

    @:native("Actime") var actime: go.Int64;
    @:native("Modtime") var modtime: go.Int64;

function new(actime: go.Int64, modtime: go.Int64);

}