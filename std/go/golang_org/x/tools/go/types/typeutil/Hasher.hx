package go.golang_org.x.tools.go.types.typeutil;

/**
    A Hasher provides a [Hasher.Hash] method to map a type to its hash value.
    Hashers are stateless, and all are equivalent.
**/
@:structInit
@:go.Type({ name: "Hasher", instanceName: "typeutil.Hasher", imports: ["golang.org/x/tools/go/types/typeutil"] })
extern class Hasher {

    /**
        Hash computes a hash value for the given type t such that
        Identical(t, t') => Hash(t) == Hash(t').
    **/
    @:native("Hash") function hash(t: go.go.types.Type): (go.UInt32);

}