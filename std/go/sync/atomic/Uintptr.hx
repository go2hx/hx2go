package go.sync.atomic;

/**
    A Uintptr is an atomic uintptr. The zero value is zero.
    
    Uintptr must not be copied after first use.
**/
@:structInit
@:go.Type({ name: "Uintptr", instanceName: "atomic.Uintptr", imports: ["sync/atomic"] })
extern class Uintptr {

    /**
        Add atomically adds delta to x and returns the new value.
    **/
    @:native("Add") function add(delta: go.UIntPtr): (go.UIntPtr);
    /**
        And atomically performs a bitwise AND operation on x using the bitmask
        provided as mask and returns the old value.
    **/
    @:native("And") function and(mask: go.UIntPtr): (go.UIntPtr);
    /**
        CompareAndSwap executes the compare-and-swap operation for x.
    **/
    @:native("CompareAndSwap") function compareAndSwap(old: go.UIntPtr, _new: go.UIntPtr): (Bool);
    /**
        Load atomically loads and returns the value stored in x.
    **/
    @:native("Load") function load(): (go.UIntPtr);
    /**
        Or atomically performs a bitwise OR operation on x using the bitmask
        provided as mask and returns the old value.
    **/
    @:native("Or") function or(mask: go.UIntPtr): (go.UIntPtr);
    /**
        Store atomically stores val into x.
    **/
    @:native("Store") function store(val: go.UIntPtr): Void;
    /**
        Swap atomically stores new into x and returns the previous value.
    **/
    @:native("Swap") function swap(_new: go.UIntPtr): (go.UIntPtr);

}