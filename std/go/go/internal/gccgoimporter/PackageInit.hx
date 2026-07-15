package go.go.internal.gccgoimporter;

@:structInit
@:go.Type({ name: "PackageInit", instanceName: "gccgoimporter.PackageInit", imports: ["go/internal/gccgoimporter"] })
extern class PackageInit {

    @:native("Name") var name: String;
    @:native("InitFunc") var initFunc: String;
    @:native("Priority") var priority: go.GoInt;

function new(name: String, initFunc: String, priority: go.GoInt);

}