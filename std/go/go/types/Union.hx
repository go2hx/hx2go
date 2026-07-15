package go.go.types;

@:structInit
@:go.Type({ name: "Union", instanceName: "types.Union", imports: ["go/types"] })
extern class Union {

    @:native("Len") function len(): go.GoInt;
    @:native("String") function string(): String;
    @:native("Term") function term(i: go.GoInt): go.Pointer<go.go.types.Term>;
    @:native("Terms") function terms(): go.iter.Seq<go.Pointer<go.go.types.Term>>;
    @:native("Underlying") function underlying(): go.go.types.Type;

}