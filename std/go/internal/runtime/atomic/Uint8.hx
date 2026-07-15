package go.internal.runtime.atomic;

@:structInit
@:go.Type({ name: "Uint8", instanceName: "atomic.Uint8", imports: ["internal/runtime/atomic"] })
extern class Uint8 {

    @:native("And") function and(value: go.UInt8): Void;
    @:native("Load") function load(): go.UInt8;
    @:native("Or") function or(value: go.UInt8): Void;
    @:native("Store") function store(value: go.UInt8): Void;

}