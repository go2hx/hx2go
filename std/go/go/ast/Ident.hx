package go.go.ast;

@:structInit
@:go.Type({ name: "Ident", instanceName: "ast.Ident", imports: ["go/ast"] })
extern class Ident {

    @:native("NamePos") var namePos: go.go.token.Pos;
    @:native("Name") var name: String;
    @:native("Obj") var obj: go.Pointer<go.go.ast.Object>;

    function new(namePos: go.go.token.Pos=cast 0, name: String="", obj: go.Pointer<go.go.ast.Object>=null);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("IsExported") function isExported(): (Bool);
    @:native("Pos") function pos(): (go.go.token.Pos);
    @:native("String") function string(): (String);

}