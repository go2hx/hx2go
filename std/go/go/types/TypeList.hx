package go.go.types;

@:structInit
@:go.Type({ name: "TypeList", instanceName: "types.TypeList", imports: ["go/types"] })
extern class TypeList {

    @:native("At") function at(i: go.GoInt): (go.go.types.Type);
    @:native("Len") function len(): (go.GoInt);
    @:native("Types") function types(): (go.iter.Seq<go.go.types.Type>);

}