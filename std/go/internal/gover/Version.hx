package go.internal.gover;

@:structInit
@:go.Type({ name: "Version", instanceName: "gover.Version", imports: ["internal/gover"] })
extern class Version {

    @:native("Major") var major: String;
    @:native("Minor") var minor: String;
    @:native("Patch") var patch: String;
    @:native("Kind") var kind: String;
    @:native("Pre") var pre: String;

function new(major: String, minor: String, patch: String, kind: String, pre: String);

}