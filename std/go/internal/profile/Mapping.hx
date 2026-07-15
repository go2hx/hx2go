package go.internal.profile;

@:structInit
@:go.Type({ name: "Mapping", instanceName: "profile.Mapping", imports: ["internal/profile"] })
extern class Mapping {

    @:native("ID") var ID: go.UInt64;
    @:native("Start") var start: go.UInt64;
    @:native("Limit") var limit: go.UInt64;
    @:native("Offset") var offset: go.UInt64;
    @:native("File") var file: String;
    @:native("BuildID") var buildID: String;
    @:native("HasFunctions") var hasFunctions: Bool;
    @:native("HasFilenames") var hasFilenames: Bool;
    @:native("HasLineNumbers") var hasLineNumbers: Bool;
    @:native("HasInlineFrames") var hasInlineFrames: Bool;

function new(ID: go.UInt64, start: go.UInt64, limit: go.UInt64, offset: go.UInt64, file: String, buildID: String, hasFunctions: Bool, hasFilenames: Bool, hasLineNumbers: Bool, hasInlineFrames: Bool);

}