package go.go.types;

@:go.Type({ name: "genericType", instanceName: "types.genericType", imports: ["go/types"] })
extern typedef GenericType = {

    @:native("String") function string(): (String);
    @:native("TypeParams") function typeParams(): (go.Pointer<go.go.types.TypeParamList>);
    @:native("Underlying") function underlying(): (go.go.types.Type);

}