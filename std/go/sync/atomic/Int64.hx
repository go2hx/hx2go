package go.sync.atomic;

/**
    An Int64 is an atomic int64. The zero value is zero.
    
    Int64 must not be copied after first use.
**/
@:structInit
@:go.Type({ name: "Int64", instanceName: "atomic.Int64", imports: ["sync/atomic"] })
extern class Int64 {

    /**
        Add atomically adds delta to x and returns the new value.
    **/
    @:native("Add") function add(delta: go.Int64): (go.Int64);
    /**
        And atomically performs a bitwise AND operation on x using the bitmask
        provided as mask and returns the old value.
    **/
    @:native("And") function and(mask: go.Int64): (go.Int64);
    /**
        CompareAndSwap executes the compare-and-swap operation for x.
    **/
    @:native("CompareAndSwap") function compareAndSwap(old: go.Int64, _new: go.Int64): (Bool);
    /**
        Load atomically loads and returns the value stored in x.
    **/
    @:native("Load") function load(): (go.Int64);
    /**
        Or atomically performs a bitwise OR operation on x using the bitmask
        provided as mask and returns the old value.
    **/
    @:native("Or") function or(mask: go.Int64): (go.Int64);
    /**
        Store atomically stores val into x.
    **/
    @:native("Store") function store(val: go.Int64): Void;
    /**
        Swap atomically stores new into x and returns the previous value.
    **/
    @:native("Swap") function swap(_new: go.Int64): (go.Int64);

}