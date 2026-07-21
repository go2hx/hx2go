package go.runtime;

@:structInit
@:go.Type({ name: "goroutineProfileStateHolder", instanceName: "runtime.goroutineProfileStateHolder", imports: ["runtime"] })
extern class GoroutineProfileStateHolder {

    @:native("CompareAndSwap") function compareAndSwap(old: go.runtime.GoroutineProfileState, _new: go.runtime.GoroutineProfileState): (Bool);
    @:native("Load") function load(): (go.runtime.GoroutineProfileState);
    @:native("Store") function store(value: go.runtime.GoroutineProfileState): Void;

}