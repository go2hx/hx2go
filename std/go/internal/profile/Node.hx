package go.internal.profile;

@:structInit
@:go.Type({ name: "Node", instanceName: "profile.Node", imports: ["internal/profile"] })
extern class Node {

    @:native("Info") var info: go.internal.profile.NodeInfo;
    @:native("Function") var _function: go.Pointer<go.internal.profile.Node>;
    @:native("Flat") var flat: go.Int64;
    @:native("FlatDiv") var flatDiv: go.Int64;
    @:native("Cum") var cum: go.Int64;
    @:native("CumDiv") var cumDiv: go.Int64;
    @:native("In") var _in: go.internal.profile.EdgeMap;
    @:native("Out") var out: go.internal.profile.EdgeMap;

function new(info: go.internal.profile.NodeInfo, _function: go.Pointer<go.internal.profile.Node>, flat: go.Int64, flatDiv: go.Int64, cum: go.Int64, cumDiv: go.Int64, _in: go.internal.profile.EdgeMap, out: go.internal.profile.EdgeMap);

    @:native("AddToEdge") function addToEdge(_to: go.Pointer<go.internal.profile.Node>, v: go.Int64, residual: Bool, _inline: Bool): Void;
    @:native("AddToEdgeDiv") function addToEdgeDiv(_to: go.Pointer<go.internal.profile.Node>, dv: go.Int64, v: go.Int64, residual: Bool, _inline: Bool): Void;
    @:native("CumValue") function cumValue(): go.Int64;
    @:native("FlatValue") function flatValue(): go.Int64;

}