package go.sync.atomic;

/**
    An Int32 is an atomic int32. The zero value is zero.
    
    Int32 must not be copied after first use.
**/
@:structInit
@:go.Type({ name: "Int32", instanceName: "atomic.Int32", imports: ["sync/atomic"] })
extern class Int32 {

    /**
        Add atomically adds delta to x and returns the new value.
    **/
    @:native("Add") function add(delta: go.Int32): (go.Int32);
    /**
        And atomically performs a bitwise AND operation on x using the bitmask
        provided as mask and returns the old value.
    **/
    @:native("And") function and(mask: go.Int32): (go.Int32);
    /**
        CompareAndSwap executes the compare-and-swap operation for x.
    **/
    @:native("CompareAndSwap") function compareAndSwap(old: go.Int32, _new: go.Int32): (Bool);
    /**
        Load atomically loads and returns the value stored in x.
    **/
    @:native("Load") function load(): (go.Int32);
    /**
        Or atomically performs a bitwise OR operation on x using the bitmask
        provided as mask and returns the old value.
    **/
    @:native("Or") function or(mask: go.Int32): (go.Int32);
    /**
        Store atomically stores val into x.
    **/
    @:native("Store") function store(val: go.Int32): Void;
    /**
        Swap atomically stores new into x and returns the previous value.
    **/
    @:native("Swap") function swap(_new: go.Int32): (go.Int32);

}