package go.go.types;

@:structInit
@:go.Type({ name: "operand", instanceName: "types.operand", imports: ["go/types"] })
extern class Operand {

    @:native("Pos") function pos(): (go.go.token.Pos);
    @:native("String") function string(): (String);

}