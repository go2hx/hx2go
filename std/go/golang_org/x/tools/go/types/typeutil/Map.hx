package go.golang_org.x.tools.go.types.typeutil;

/**
    Map is a hash-table-based mapping from types (types.Type) to
    arbitrary values.  The concrete types that implement
    the Type interface are pointers.  Since they are not canonicalized,
    == cannot be used to check for equivalence, and thus we cannot
    simply use a Go map.
    
    Just as with map[K]V, a nil *Map is a valid empty map.
    
    Read-only map operations ([Map.At], [Map.Len], and so on) may
    safely be called concurrently.
    
    TODO(adonovan): deprecate in favor of https://go.dev/issues/69420
    and 69559, if the latter proposals for a generic hash-map type and
    a types.Hash function are accepted.
**/
@:structInit
@:go.Type({ name: "Map", instanceName: "typeutil.Map", imports: ["golang.org/x/tools/go/types/typeutil"] })
extern class Map {

    /**
        At returns the map entry for the given key.
        The result is nil if the entry is not present.
    **/
    @:native("At") function at(key: go.go.types.Type): (Dynamic);
    /**
        Delete removes the entry with the given key, if any.
        It returns true if the entry was found.
    **/
    @:native("Delete") function delete(key: go.go.types.Type): (Bool);
    /**
        Iterate calls function f on each entry in the map in unspecified order.
        
        If f should mutate the map, Iterate provides the same guarantees as
        Go maps: if f deletes a map entry that Iterate has not yet reached,
        f will not be invoked for it, but if f inserts a map entry that
        Iterate has not yet reached, whether or not f will be invoked for
        it is unspecified.
    **/
    @:native("Iterate") function iterate(f: (key: go.go.types.Type, value: Dynamic) -> Void): Void;
    /**
        Keys returns a new slice containing the set of map keys.
        The order is unspecified.
    **/
    @:native("Keys") function keys(): (go.Slice<go.go.types.Type>);
    /**
        KeysString returns a string representation of the map's key set.
        Order is unspecified.
    **/
    @:native("KeysString") function keysString(): (String);
    /**
        Len returns the number of map entries.
    **/
    @:native("Len") function len(): (go.GoInt);
    /**
        Set sets the map entry for key to val,
        and returns the previous entry, if any.
    **/
    @:native("Set") function set(key: go.go.types.Type, value: Dynamic): (Dynamic);
    /**
        SetHasher has no effect.
        
        It is a relic of an optimization that is no longer profitable. Do
        not use [Hasher], [MakeHasher], or [SetHasher] in new code.
    **/
    @:native("SetHasher") function setHasher(p0: go.golang_org.x.tools.go.types.typeutil.Hasher): Void;
    /**
        String returns a string representation of the map's entries.
        Values are printed using fmt.Sprintf("%v", v).
        Order is unspecified.
    **/
    @:native("String") function string(): (String);

}