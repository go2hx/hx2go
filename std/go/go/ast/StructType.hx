package go.go.ast;

@:structInit
@:go.Type({ name: "StructType", instanceName: "ast.StructType", imports: ["go/ast"] })
extern class StructType {

    @:native("Struct") var struct: go.go.token.Pos;
    @:native("Fields") var fields: go.Pointer<go.go.ast.FieldList>;
    @:native("Incomplete") var incomplete: Bool;

    function new(struct: go.go.token.Pos=cast 0, fields: go.Pointer<go.go.ast.FieldList>=null, incomplete: Bool=false);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}