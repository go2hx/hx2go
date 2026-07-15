package go.go.types;

@:structInit
@:go.Type({ name: "Struct", instanceName: "types.Struct", imports: ["go/types"] })
extern class Struct {

    @:native("Field") function field(i: go.GoInt): go.Pointer<go.go.types.Var>;
    @:native("Fields") function fields(): go.iter.Seq<go.Pointer<go.go.types.Var>>;
    @:native("NumFields") function numFields(): go.GoInt;
    @:native("String") function string(): String;
    @:native("Tag") function tag(i: go.GoInt): String;
    @:native("Underlying") function underlying(): go.go.types.Type;

}