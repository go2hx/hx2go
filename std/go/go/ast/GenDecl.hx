package go.go.ast;

@:structInit
@:go.Type({ name: "GenDecl", instanceName: "ast.GenDecl", imports: ["go/ast"] })
extern class GenDecl {

    @:native("Doc") var doc: go.Pointer<go.go.ast.CommentGroup>;
    @:native("TokPos") var tokPos: go.go.token.Pos;
    @:native("Tok") var tok: go.go.token.Token;
    @:native("Lparen") var lparen: go.go.token.Pos;
    @:native("Specs") var specs: go.Slice<go.go.ast.Spec>;
    @:native("Rparen") var rparen: go.go.token.Pos;

    function new(doc: go.Pointer<go.go.ast.CommentGroup>=null, tokPos: go.go.token.Pos=cast 0, tok: go.go.token.Token=cast 0, lparen: go.go.token.Pos=cast 0, specs: go.Slice<go.go.ast.Spec>=null, rparen: go.go.token.Pos=cast 0);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}