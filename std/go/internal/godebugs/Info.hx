package go.internal.godebugs;

@:structInit
@:go.Type({ name: "Info", instanceName: "godebugs.Info", imports: ["internal/godebugs"] })
extern class Info {

    @:native("Name") var name: String;
    @:native("Package") var _package: String;
    @:native("Changed") var changed: go.GoInt;
    @:native("Old") var old: String;
    @:native("Opaque") var opaque: Bool;
    @:native("Immutable") var immutable: Bool;

function new(name: String, _package: String, changed: go.GoInt, old: String, opaque: Bool, immutable: Bool);

}