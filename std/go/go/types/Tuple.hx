package go.go.types;

@:structInit
@:go.Type({ name: "Tuple", instanceName: "types.Tuple", imports: ["go/types"] })
extern class Tuple {

    @:native("At") function at(i: go.GoInt): (go.Pointer<go.go.types.Var>);
    @:native("Len") function len(): (go.GoInt);
    @:native("String") function string(): (String);
    @:native("Underlying") function underlying(): (go.go.types.Type);
    @:native("Variables") function variables(): (go.iter.Seq<go.Pointer<go.go.types.Var>>);

}