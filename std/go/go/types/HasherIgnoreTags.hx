package go.go.types;

/**
    HasherIgnoreTags is a variant of [Hasher] that is
    consistent with [IdenticalIgnoreTags].
**/
@:structInit
@:go.Type({ name: "HasherIgnoreTags", instanceName: "types.HasherIgnoreTags", imports: ["go/types"] })
extern class HasherIgnoreTags {

    @:native("Equal") function equal(x: go.go.types.Type, y: go.go.types.Type): (Bool);
    @:native("Hash") function hash(h: go.Pointer<go.hash.maphash.Hash>, t: go.go.types.Type): Void;

}