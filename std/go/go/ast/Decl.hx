package go.go.ast;

/**
    All declaration nodes implement the Decl interface.
**/
@:go.Type({ name: "Decl", instanceName: "ast.Decl", imports: ["go/ast"] })
extern typedef Decl = {

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}