package go.internal.profile;

@:structInit
@:go.Type({ name: "Function", instanceName: "profile.Function", imports: ["internal/profile"] })
extern class Function {

    @:native("ID") var ID: go.UInt64;
    @:native("Name") var name: String;
    @:native("SystemName") var systemName: String;
    @:native("Filename") var filename: String;
    @:native("StartLine") var startLine: go.Int64;

function new(ID: go.UInt64, name: String, systemName: String, filename: String, startLine: go.Int64);

}