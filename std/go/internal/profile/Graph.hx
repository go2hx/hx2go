package go.internal.profile;

@:structInit
@:go.Type({ name: "Graph", instanceName: "profile.Graph", imports: ["internal/profile"] })
extern class Graph {

    @:native("Nodes") var nodes: go.internal.profile.Nodes;

function new(nodes: go.internal.profile.Nodes);

    @:native("String") function string(): String;

}