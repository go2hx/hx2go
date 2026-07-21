package go.runtime;

@:structInit
@:go.Type({ name: "atomicOffAddr", instanceName: "runtime.atomicOffAddr", imports: ["runtime"] })
extern class AtomicOffAddr {

    @:native("Clear") function clear(): Void;
    @:go.Tuple("p0", "p1") @:native("Load") function load(): (go.Tuple<{ p0: go.UIntPtr, p1: Bool }>);
    @:native("StoreMarked") function storeMarked(addr: go.UIntPtr): Void;
    @:native("StoreMin") function storeMin(addr: go.UIntPtr): Void;
    @:native("StoreUnmark") function storeUnmark(markedAddr: go.UIntPtr, newAddr: go.UIntPtr): Void;

}