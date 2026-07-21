package go.go.ast;

@:structInit
@:go.Type({ name: "InterfaceType", instanceName: "ast.InterfaceType", imports: ["go/ast"] })
extern class InterfaceType {

    @:native("Interface") var _interface: go.go.token.Pos;
    @:native("Methods") var methods: go.Pointer<go.go.ast.FieldList>;
    @:native("Incomplete") var incomplete: Bool;

    function new(_interface: go.go.token.Pos, methods: go.Pointer<go.go.ast.FieldList>, incomplete: Bool);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}