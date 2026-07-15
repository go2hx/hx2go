package go.sync.atomic;

@:structInit
@:go.Type({ name: "Uintptr", instanceName: "atomic.Uintptr", imports: ["sync/atomic"] })
extern class Uintptr {

    @:native("Add") function add(delta: go.UIntPtr): go.UIntPtr;
    @:native("And") function and(mask: go.UIntPtr): go.UIntPtr;
    @:native("CompareAndSwap") function compareAndSwap(old: go.UIntPtr, _new: go.UIntPtr): Bool;
    @:native("Load") function load(): go.UIntPtr;
    @:native("Or") function or(mask: go.UIntPtr): go.UIntPtr;
    @:native("Store") function store(val: go.UIntPtr): Void;
    @:native("Swap") function swap(_new: go.UIntPtr): go.UIntPtr;

}