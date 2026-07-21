package go.go.types;

@:go.Type({ name: "typeParamsById", instanceName: "types.typeParamsById", imports: ["go/types"] })
extern class TypeParamsById {

    @:native("Len") function len(): (go.GoInt);
    @:native("Less") function less(i: go.GoInt, j: go.GoInt): (Bool);
    @:native("Swap") function swap(i: go.GoInt, j: go.GoInt): Void;

}