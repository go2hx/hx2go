package go.internal.profile;

@:structInit
@:go.Type({ name: "Edge", instanceName: "profile.Edge", imports: ["internal/profile"] })
extern class Edge {

    @:native("Src") var src: go.Pointer<go.internal.profile.Node>;
    @:native("Dest") var dest: go.Pointer<go.internal.profile.Node>;
    @:native("Weight") var weight: go.Int64;
    @:native("WeightDiv") var weightDiv: go.Int64;
    @:native("Residual") var residual: Bool;
    @:native("Inline") var _inline: Bool;

function new(src: go.Pointer<go.internal.profile.Node>, dest: go.Pointer<go.internal.profile.Node>, weight: go.Int64, weightDiv: go.Int64, residual: Bool, _inline: Bool);

    @:native("WeightValue") function weightValue(): go.Int64;

}