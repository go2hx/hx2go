package go.sync.atomic;

/**
    A Pointer is an atomic pointer of type *T. The zero value is a nil *T.
    
    Pointer must not be copied after first use.
**/
@:structInit
@:go.Type({ name: "Pointer", instanceName: "atomic.Pointer", imports: ["sync/atomic"] })
extern class Pointer<T: Dynamic> {

    /**
        CompareAndSwap executes the compare-and-swap operation for x.
    **/
    @:native("CompareAndSwap") function compareAndSwap(old: go.Pointer<T>, _new: go.Pointer<T>): (Bool);
    /**
        Load atomically loads and returns the value stored in x.
    **/
    @:native("Load") function load(): (go.Pointer<T>);
    /**
        Store atomically stores val into x.
    **/
    @:native("Store") function store(val: go.Pointer<T>): Void;
    /**
        Swap atomically stores new into x and returns the previous value.
    **/
    @:native("Swap") function swap(_new: go.Pointer<T>): (go.Pointer<T>);

}