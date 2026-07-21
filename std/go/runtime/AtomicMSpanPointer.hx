package go.runtime;

@:structInit
@:go.Type({ name: "atomicMSpanPointer", instanceName: "runtime.atomicMSpanPointer", imports: ["runtime"] })
extern class AtomicMSpanPointer {

    @:native("Load") function load(): (go.Pointer<go.runtime.Mspan>);
    @:native("StoreNoWB") function storeNoWB(s: go.Pointer<go.runtime.Mspan>): Void;

}