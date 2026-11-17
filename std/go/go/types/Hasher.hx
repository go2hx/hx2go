package go.go.types;

/**
    Hasher defines a hash function and equivalence relation
    for [Types] that is consistent with [Identical].
    Hashers are stateless.
**/
@:structInit
@:go.Type({ name: "Hasher", instanceName: "types.Hasher", imports: ["go/types"] })
extern class Hasher {

    @:native("Equal") function equal(x: go.go.types.Type, y: go.go.types.Type): (Bool);
    @:native("Hash") function hash(h: go.Pointer<go.hash.maphash.Hash>, t: go.go.types.Type): Void;

}