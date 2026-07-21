package go.go.types;

@:structInit
@:go.Type({ name: "indexedExpr", instanceName: "types.indexedExpr", imports: ["go/types"] })
extern class IndexedExpr {

    @:native("Pos") function pos(): (go.go.token.Pos);

}