package go.internal.abi;

@:structInit
@:go.Type({ name: "InterfaceSwitchCache", instanceName: "abi.InterfaceSwitchCache", imports: ["internal/abi"] })
extern class InterfaceSwitchCache {

    @:native("Mask") var mask: go.UIntPtr;
    @:native("Entries") var entries: go.GoArray<go.internal.abi.InterfaceSwitchCacheEntry, 1>;

function new(mask: go.UIntPtr, entries: go.GoArray<go.internal.abi.InterfaceSwitchCacheEntry, 1>);

}