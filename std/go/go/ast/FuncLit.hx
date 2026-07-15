package go.go.ast;

@:structInit
@:go.Type({ name: "FuncLit", instanceName: "ast.FuncLit", imports: ["go/ast"] })
extern class FuncLit {

    @:native("Type") var type: go.Pointer<go.go.ast.FuncType>;
    @:native("Body") var body: go.Pointer<go.go.ast.BlockStmt>;

function new(type: go.Pointer<go.go.ast.FuncType>, body: go.Pointer<go.go.ast.BlockStmt>);

    @:native("End") function end(): go.go.token.Pos;
    @:native("Pos") function pos(): go.go.token.Pos;

}