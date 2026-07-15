package go.internal.profile;

@:structInit
@:go.Type({ name: "Location", instanceName: "profile.Location", imports: ["internal/profile"] })
extern class Location {

    @:native("ID") var ID: go.UInt64;
    @:native("Mapping") var mapping: go.Pointer<go.internal.profile.Mapping>;
    @:native("Address") var address: go.UInt64;
    @:native("Line") var line: go.Slice<go.internal.profile.Line>;
    @:native("IsFolded") var isFolded: Bool;

function new(ID: go.UInt64, mapping: go.Pointer<go.internal.profile.Mapping>, address: go.UInt64, line: go.Slice<go.internal.profile.Line>, isFolded: Bool);

}