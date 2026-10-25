package go.hash.maphash;

/**
    ComparableHasher is an implementation of [Hasher] whose
    Equal(x, y) method is consistent with x == y.
    
    ComparableHasher is defined only for comparable types.
    The type system will not prevent you from instantiating a type
    such as ComparableHasher[any]; nonetheless you must not pass
    non-comparable argument values to its Hash or Equal methods.
**/
@:structInit
@:go.Type({ name: "ComparableHasher", instanceName: "maphash.ComparableHasher", imports: ["hash/maphash"] })
extern class ComparableHasher<T: go.Comparable> {

    @:native("Equal") function equal(x: T, y: T): (Bool);
    @:native("Hash") function hash(h: go.Pointer<go.hash.maphash.Hash>, v: T): Void;

}