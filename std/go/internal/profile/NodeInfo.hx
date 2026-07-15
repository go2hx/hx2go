package go.internal.profile;

@:structInit
@:go.Type({ name: "NodeInfo", instanceName: "profile.NodeInfo", imports: ["internal/profile"] })
extern class NodeInfo {

    @:native("Name") var name: String;
    @:native("Address") var address: go.UInt64;
    @:native("StartLine") var startLine: go.GoInt;
    @:native("Lineno") var lineno: go.GoInt;

function new(name: String, address: go.UInt64, startLine: go.GoInt, lineno: go.GoInt);

    @:native("NameComponents") function nameComponents(): go.Slice<String>;
    @:native("PrintableName") function printableName(): String;

}