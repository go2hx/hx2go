package go.internal;

@:go.Type({ name: "dag", instanceName: "dag.dag", imports: ["internal/dag"] })
extern class Dag {

    @:native("Parse") static function parse(dag: String): go.Result<go.Pointer<go.internal.dag.Graph>>;

}