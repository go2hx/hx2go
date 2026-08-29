package go.go.ast;

/**
    An Ellipsis node stands for the "..." type in a
    parameter list or the "..." length in an array type.
**/
@:structInit
@:go.Type({ name: "Ellipsis", instanceName: "ast.Ellipsis", imports: ["go/ast"] })
extern class Ellipsis {

    @:native("Ellipsis") var ellipsis: go.go.token.Pos;
    @:native("Elt") var elt: go.go.ast.Expr;

    function new(ellipsis: go.go.token.Pos=cast 0, elt: go.go.ast.Expr=null);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}