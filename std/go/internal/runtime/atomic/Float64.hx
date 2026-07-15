package go.internal.runtime.atomic;

@:structInit
@:go.Type({ name: "Float64", instanceName: "atomic.Float64", imports: ["internal/runtime/atomic"] })
extern class Float64 {

    @:native("Load") function load(): Float;
    @:native("Store") function store(value: Float): Void;

}