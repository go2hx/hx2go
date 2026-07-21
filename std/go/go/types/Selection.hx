package go.go.types;

@:structInit
@:go.Type({ name: "Selection", instanceName: "types.Selection", imports: ["go/types"] })
extern class Selection {

    @:native("Index") function index(): (go.Slice<go.GoInt>);
    @:native("Indirect") function indirect(): (Bool);
    @:native("Kind") function kind(): (go.go.types.SelectionKind);
    @:native("Obj") function obj(): (go.go.types.Object);
    @:native("Recv") function recv(): (go.go.types.Type);
    @:native("String") function string(): (String);
    @:native("Type") function type(): (go.go.types.Type);

}