package go.sync.atomic;

/**
    A Value provides an atomic load and store of a consistently typed value.
    The zero value for a Value returns nil from [Value.Load].
    Once [Value.Store] has been called, a Value must not be copied.
    
    A Value must not be copied after first use.
**/
@:structInit
@:go.Type({ name: "Value", instanceName: "atomic.Value", imports: ["sync/atomic"] })
extern class Value {

    /**
        CompareAndSwap executes the compare-and-swap operation for the [Value].
        
        All calls to CompareAndSwap for a given Value must use values of the same
        concrete type. CompareAndSwap of an inconsistent type panics, as does
        CompareAndSwap(old, nil).
    **/
    @:native("CompareAndSwap") function compareAndSwap(old: Dynamic, _new: Dynamic): (Bool);
    /**
        Load returns the value set by the most recent Store.
        It returns nil if there has been no call to Store for this Value.
    **/
    @:native("Load") function load(): (Dynamic);
    /**
        Store sets the value of the [Value] v to val.
        All calls to Store for a given Value must use values of the same concrete type.
        Store of an inconsistent type panics, as does Store(nil).
    **/
    @:native("Store") function store(val: Dynamic): Void;
    /**
        Swap stores new into Value and returns the previous value. It returns nil if
        the Value is empty.
        
        All calls to Swap for a given Value must use values of the same concrete
        type. Swap of an inconsistent type panics, as does Swap(nil).
    **/
    @:native("Swap") function swap(_new: Dynamic): (Dynamic);

}