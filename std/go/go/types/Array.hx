package go.go.types;

@:structInit
@:go.Type({ name: "Array", instanceName: "types.Array", imports: ["go/types"] })
extern class Array {

    @:native("Elem") function elem(): (go.go.types.Type);
    @:native("Len") function len(): (go.Int64);
    @:native("String") function string(): (String);
    @:native("Underlying") function underlying(): (go.go.types.Type);

}