package go.sync.atomic;

/**
    A Bool is an atomic boolean value.
    The zero value is false.
    
    Bool must not be copied after first use.
**/
@:structInit
@:go.Type({ name: "Bool", instanceName: "atomic.Bool", imports: ["sync/atomic"] })
extern class Bool {

    /**
        CompareAndSwap executes the compare-and-swap operation for the boolean value x.
    **/
    @:native("CompareAndSwap") function compareAndSwap(old: Bool, _new: Bool): (Bool);
    /**
        Load atomically loads and returns the value stored in x.
    **/
    @:native("Load") function load(): (Bool);
    /**
        Store atomically stores val into x.
    **/
    @:native("Store") function store(val: Bool): Void;
    /**
        Swap atomically stores new into x and returns the previous value.
    **/
    @:native("Swap") function swap(_new: Bool): (Bool);

}