package go.internal.abi;

@:structInit
@:go.Type({ name: "InterfaceSwitchCacheEntry", instanceName: "abi.InterfaceSwitchCacheEntry", imports: ["internal/abi"] })
extern class InterfaceSwitchCacheEntry {

    @:native("Typ") var typ: go.UIntPtr;
    @:native("Case") var _case: go.GoInt;
    @:native("Itab") var itab: go.UIntPtr;

function new(typ: go.UIntPtr, _case: go.GoInt, itab: go.UIntPtr);

}