package go.go.types;

@:go.Type({ name: "positioner", instanceName: "types.positioner", imports: ["go/types"] })
extern typedef Positioner = {

    @:native("Pos") function pos(): (go.go.token.Pos);

}