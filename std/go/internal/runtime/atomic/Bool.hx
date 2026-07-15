package go.internal.runtime.atomic;

@:structInit
@:go.Type({ name: "Bool", instanceName: "atomic.Bool", imports: ["internal/runtime/atomic"] })
extern class Bool {

    @:native("Load") function load(): Bool;
    @:native("Store") function store(value: Bool): Void;

}