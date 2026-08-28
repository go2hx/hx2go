package go;

/**
    Package sync provides basic synchronization primitives such as mutual
    exclusion locks. Other than the [Once] and [WaitGroup] types, most are intended
    for use by low-level library routines. Higher-level synchronization is
    better done via channels and communication.
    
    Values containing the types defined in this package should not be copied.
**/
@:go.Type({ name: "sync", instanceName: "sync.sync", imports: ["sync"] })
extern class Sync {

    /**
        NewCond returns a new Cond with Locker l.
    **/
    @:native("NewCond") static function newCond(l: go.sync.Locker): (go.Pointer<go.sync.Cond>);
    /**
        OnceFunc returns a function that invokes f only once. The returned function
        may be called concurrently.
        
        If f panics, the returned function will panic with the same value on every call.
    **/
    @:native("OnceFunc") static function onceFunc(f: () -> Void): (() -> Void);
    /**
        OnceValue returns a function that invokes f only once and returns the value
        returned by f. The returned function may be called concurrently.
        
        If f panics, the returned function will panic with the same value on every call.
    **/
    @:native("OnceValue") static function onceValue<T: Dynamic>(f: () -> (T)): (() -> (T));
    /**
        OnceValues returns a function that invokes f only once and returns the values
        returned by f. The returned function may be called concurrently.
        
        If f panics, the returned function will panic with the same value on every call.
    **/
    @:native("OnceValues") static function onceValues<T1: Dynamic, T2: Dynamic>(f: () -> (go.Tuple<{ p0: T1, p1: T2 }>)): (() -> (go.Tuple<{ p0: T1, p1: T2 }>));

}