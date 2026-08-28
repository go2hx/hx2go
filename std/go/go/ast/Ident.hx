package go.go.ast;

/**
    An Ident node represents an identifier.
**/
@:structInit
@:go.Type({ name: "Ident", instanceName: "ast.Ident", imports: ["go/ast"] })
extern class Ident {

    @:native("NamePos") var namePos: go.go.token.Pos;
    @:native("Name") var name: String;
    @:native("Obj") var obj: go.Pointer<go.go.ast.Object>;

    function new(namePos: go.go.token.Pos=cast 0, name: String="", obj: go.Pointer<go.go.ast.Object>=null);

    @:native("End") function end(): (go.go.token.Pos);
    /**
        IsExported reports whether id starts with an upper-case letter.
    **/
    @:native("IsExported") function isExported(): (Bool);
    @:native("Pos") function pos(): (go.go.token.Pos);
    @:native("String") function string(): (String);

}