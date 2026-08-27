package go.go.ast;

@:structInit
@:go.Type({ name: "CompositeLit", instanceName: "ast.CompositeLit", imports: ["go/ast"] })
extern class CompositeLit {

    @:native("Type") var type: go.go.ast.Expr;
    @:native("Lbrace") var lbrace: go.go.token.Pos;
    @:native("Elts") var elts: go.Slice<go.go.ast.Expr>;
    @:native("Rbrace") var rbrace: go.go.token.Pos;
    @:native("Incomplete") var incomplete: Bool;

    function new(type: go.go.ast.Expr=null, lbrace: go.go.token.Pos=cast 0, elts: go.Slice<go.go.ast.Expr>=null, rbrace: go.go.token.Pos=cast 0, incomplete: Bool=false);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}