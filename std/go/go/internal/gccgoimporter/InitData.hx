package go.go.internal.gccgoimporter;

@:structInit
@:go.Type({ name: "InitData", instanceName: "gccgoimporter.InitData", imports: ["go/internal/gccgoimporter"] })
extern class InitData {

    @:native("Priority") var priority: go.GoInt;
    @:native("Inits") var inits: go.Slice<go.go.internal.gccgoimporter.PackageInit>;

function new(priority: go.GoInt, inits: go.Slice<go.go.internal.gccgoimporter.PackageInit>);

}