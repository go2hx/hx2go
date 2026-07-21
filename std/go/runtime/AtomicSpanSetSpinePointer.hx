package go.runtime;

@:structInit
@:go.Type({ name: "atomicSpanSetSpinePointer", instanceName: "runtime.atomicSpanSetSpinePointer", imports: ["runtime"] })
extern class AtomicSpanSetSpinePointer {

    @:native("Load") function load(): (go.runtime.SpanSetSpinePointer);
    @:native("StoreNoWB") function storeNoWB(p: go.runtime.SpanSetSpinePointer): Void;

}