package go.golang_org.x.tools.go.ast;

@:go.Type({ name: "inspector", instanceName: "inspector.inspector", imports: ["golang.org/x/tools/go/ast/inspector"] })
extern class Inspector {

    @:native("All") static function all<N: Dynamic, S: Dynamic>(_in: go.Pointer<go.golang_org.x.tools.go.ast.inspector.Inspector>): (go.iter.Seq<N>);
    @:native("New") static function _new(files: go.Slice<go.Pointer<go.go.ast.File>>): (go.Pointer<go.golang_org.x.tools.go.ast.inspector.Inspector>);

}