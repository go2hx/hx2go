package go.go.types;

@:go.Type({ name: "Type", instanceName: "types.Type", imports: ["go/types"] })
extern typedef Type = {

    @:native("String") function string(): String;
    @:native("Underlying") function underlying(): go.go.types.Type;

}