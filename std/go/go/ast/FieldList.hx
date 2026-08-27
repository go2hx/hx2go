package go.go.ast;

@:structInit
@:go.Type({ name: "FieldList", instanceName: "ast.FieldList", imports: ["go/ast"] })
extern class FieldList {

    @:native("Opening") var opening: go.go.token.Pos;
    @:native("List") var list: go.Slice<go.Pointer<go.go.ast.Field>>;
    @:native("Closing") var closing: go.go.token.Pos;

    function new(opening: go.go.token.Pos=cast 0, list: go.Slice<go.Pointer<go.go.ast.Field>>=null, closing: go.go.token.Pos=cast 0);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("NumFields") function numFields(): (go.GoInt);
    @:native("Pos") function pos(): (go.go.token.Pos);

}