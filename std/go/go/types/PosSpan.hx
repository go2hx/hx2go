package go.go.types;

@:structInit
@:go.Type({ name: "posSpan", instanceName: "types.posSpan", imports: ["go/types"] })
extern class PosSpan {

    @:native("Pos") function pos(): (go.go.token.Pos);

}