package go.internal.abi;

@:structInit
@:go.Type({ name: "TypeAssertCacheEntry", instanceName: "abi.TypeAssertCacheEntry", imports: ["internal/abi"] })
extern class TypeAssertCacheEntry {

    @:native("Typ") var typ: go.UIntPtr;
    @:native("Itab") var itab: go.UIntPtr;

function new(typ: go.UIntPtr, itab: go.UIntPtr);

}