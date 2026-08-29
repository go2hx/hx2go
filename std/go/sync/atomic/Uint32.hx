package go.sync.atomic;

/**
    A Uint32 is an atomic uint32. The zero value is zero.
    
    Uint32 must not be copied after first use.
**/
@:structInit
@:go.Type({ name: "Uint32", instanceName: "atomic.Uint32", imports: ["sync/atomic"] })
extern class Uint32 {

    /**
        Add atomically adds delta to x and returns the new value.
    **/
    @:native("Add") function add(delta: go.UInt32): (go.UInt32);
    /**
        And atomically performs a bitwise AND operation on x using the bitmask
        provided as mask and returns the old value.
    **/
    @:native("And") function and(mask: go.UInt32): (go.UInt32);
    /**
        CompareAndSwap executes the compare-and-swap operation for x.
    **/
    @:native("CompareAndSwap") function compareAndSwap(old: go.UInt32, _new: go.UInt32): (Bool);
    /**
        Load atomically loads and returns the value stored in x.
    **/
    @:native("Load") function load(): (go.UInt32);
    /**
        Or atomically performs a bitwise OR operation on x using the bitmask
        provided as mask and returns the old value.
    **/
    @:native("Or") function or(mask: go.UInt32): (go.UInt32);
    /**
        Store atomically stores val into x.
    **/
    @:native("Store") function store(val: go.UInt32): Void;
    /**
        Swap atomically stores new into x and returns the previous value.
    **/
    @:native("Swap") function swap(_new: go.UInt32): (go.UInt32);

}