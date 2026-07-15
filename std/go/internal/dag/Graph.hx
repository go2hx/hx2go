package go.internal.dag;

@:structInit
@:go.Type({ name: "Graph", instanceName: "dag.Graph", imports: ["internal/dag"] })
extern class Graph {

    @:native("Nodes") var nodes: go.Slice<String>;

function new(nodes: go.Slice<String>);

    @:native("AddEdge") function addEdge(_from: String, _to: String): Void;
    @:native("DelEdge") function delEdge(_from: String, _to: String): Void;
    @:native("Edges") function edges(_from: String): go.Slice<String>;
    @:native("HasEdge") function hasEdge(_from: String, _to: String): Bool;
    @:native("Topo") function topo(): go.Slice<String>;
    @:native("TransitiveReduction") function transitiveReduction(): Void;
    @:native("Transpose") function transpose(): Void;

}