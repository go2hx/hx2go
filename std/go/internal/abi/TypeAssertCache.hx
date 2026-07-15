package go.internal.abi;

@:structInit
@:go.Type({ name: "TypeAssertCache", instanceName: "abi.TypeAssertCache", imports: ["internal/abi"] })
extern class TypeAssertCache {

    @:native("Mask") var mask: go.UIntPtr;
    @:native("Entries") var entries: go.GoArray<go.internal.abi.TypeAssertCacheEntry, 1>;

function new(mask: go.UIntPtr, entries: go.GoArray<go.internal.abi.TypeAssertCacheEntry, 1>);

}