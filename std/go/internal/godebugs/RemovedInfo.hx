package go.internal.godebugs;

@:structInit
@:go.Type({ name: "RemovedInfo", instanceName: "godebugs.RemovedInfo", imports: ["internal/godebugs"] })
extern class RemovedInfo {

    @:native("Name") var name: String;
    @:native("Removed") var removed: go.GoInt;

function new(name: String, removed: go.GoInt);

}