package go.go.ast;

@:structInit
@:go.Type({ name: "FuncType", instanceName: "ast.FuncType", imports: ["go/ast"] })
extern class FuncType {

    @:native("Func") var func: go.go.token.Pos;
    @:native("TypeParams") var typeParams: go.Pointer<go.go.ast.FieldList>;
    @:native("Params") var params: go.Pointer<go.go.ast.FieldList>;
    @:native("Results") var results: go.Pointer<go.go.ast.FieldList>;

    function new(func: go.go.token.Pos, typeParams: go.Pointer<go.go.ast.FieldList>, params: go.Pointer<go.go.ast.FieldList>, results: go.Pointer<go.go.ast.FieldList>);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}