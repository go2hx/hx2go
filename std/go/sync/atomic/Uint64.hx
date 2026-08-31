package go.sync.atomic;

/**
    A Uint64 is an atomic uint64. The zero value is zero.
    
    Uint64 must not be copied after first use.
**/
@:structInit
@:go.Type({ name: "Uint64", instanceName: "atomic.Uint64", imports: ["sync/atomic"] })
extern class Uint64 {

    /**
        Add atomically adds delta to x and returns the new value.
    **/
    @:native("Add") function add(delta: go.UInt64): (go.UInt64);
    /**
        And atomically performs a bitwise AND operation on x using the bitmask
        provided as mask and returns the old value.
    **/
    @:native("And") function and(mask: go.UInt64): (go.UInt64);
    /**
        CompareAndSwap executes the compare-and-swap operation for x.
    **/
    @:native("CompareAndSwap") function compareAndSwap(old: go.UInt64, _new: go.UInt64): (Bool);
    /**
        Load atomically loads and returns the value stored in x.
    **/
    @:native("Load") function load(): (go.UInt64);
    /**
        Or atomically performs a bitwise OR operation on x using the bitmask
        provided as mask and returns the old value.
    **/
    @:native("Or") function or(mask: go.UInt64): (go.UInt64);
    /**
        Store atomically stores val into x.
    **/
    @:native("Store") function store(val: go.UInt64): Void;
    /**
        Swap atomically stores new into x and returns the previous value.
    **/
    @:native("Swap") function swap(_new: go.UInt64): (go.UInt64);

}