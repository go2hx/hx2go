package go.go.ast;

@:structInit
@:go.Type({ name: "FuncDecl", instanceName: "ast.FuncDecl", imports: ["go/ast"] })
extern class FuncDecl {

    @:native("Doc") var doc: go.Pointer<go.go.ast.CommentGroup>;
    @:native("Recv") var recv: go.Pointer<go.go.ast.FieldList>;
    @:native("Name") var name: go.Pointer<go.go.ast.Ident>;
    @:native("Type") var type: go.Pointer<go.go.ast.FuncType>;
    @:native("Body") var body: go.Pointer<go.go.ast.BlockStmt>;

function new(doc: go.Pointer<go.go.ast.CommentGroup>, recv: go.Pointer<go.go.ast.FieldList>, name: go.Pointer<go.go.ast.Ident>, type: go.Pointer<go.go.ast.FuncType>, body: go.Pointer<go.go.ast.BlockStmt>);

    @:native("End") function end(): go.go.token.Pos;
    @:native("Pos") function pos(): go.go.token.Pos;

}