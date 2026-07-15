package go.go.types;

@:structInit
@:go.Type({ name: "TypeParamList", instanceName: "types.TypeParamList", imports: ["go/types"] })
extern class TypeParamList {

    @:native("At") function at(i: go.GoInt): go.Pointer<go.go.types.TypeParam>;
    @:native("Len") function len(): go.GoInt;
    @:native("TypeParams") function typeParams(): go.iter.Seq<go.Pointer<go.go.types.TypeParam>>;

}