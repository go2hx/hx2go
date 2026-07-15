package go.internal.xcoff;

@:structInit
@:go.Type({ name: "MemberHeader", instanceName: "xcoff.MemberHeader", imports: ["internal/xcoff"] })
extern class MemberHeader {

    @:native("Name") var name: String;
    @:native("Size") var size: go.UInt64;

function new(name: String, size: go.UInt64);

}