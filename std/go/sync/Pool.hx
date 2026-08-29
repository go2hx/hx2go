package go.sync;

/**
    A Pool is a set of temporary objects that may be individually saved and
    retrieved.
    
    Any item stored in the Pool may be removed automatically at any time without
    notification. If the Pool holds the only reference when this happens, the
    item might be deallocated.
    
    A Pool is safe for use by multiple goroutines simultaneously.
    
    Pool's purpose is to cache allocated but unused items for later reuse,
    relieving pressure on the garbage collector. That is, it makes it easy to
    build efficient, thread-safe free lists. However, it is not suitable for all
    free lists.
    
    An appropriate use of a Pool is to manage a group of temporary items
    silently shared among and potentially reused by concurrent independent
    clients of a package. Pool provides a way to amortize allocation overhead
    across many clients.
    
    An example of good use of a Pool is in the fmt package, which maintains a
    dynamically-sized store of temporary output buffers. The store scales under
    load (when many goroutines are actively printing) and shrinks when
    quiescent.
    
    On the other hand, a free list maintained as part of a short-lived object is
    not a suitable use for a Pool, since the overhead does not amortize well in
    that scenario. It is more efficient to have such objects implement their own
    free list.
    
    A Pool must not be copied after first use.
    
    In the terminology of [the Go memory model], a call to Put(x) “synchronizes before”
    a call to [Pool.Get] returning that same value x.
    Similarly, a call to New returning x “synchronizes before”
    a call to Get returning that same value x.
    
    [the Go memory model]: https://go.dev/ref/mem
**/
@:structInit
@:go.Type({ name: "Pool", instanceName: "sync.Pool", imports: ["sync"] })
extern class Pool {

    @:native("New") var _new: () -> (Dynamic);

    function new(_new: () -> (Dynamic)=null);

    /**
        Get selects an arbitrary item from the [Pool], removes it from the
        Pool, and returns it to the caller.
        Get may choose to ignore the pool and treat it as empty.
        Callers should not assume any relation between values passed to [Pool.Put] and
        the values returned by Get.
        
        If Get would otherwise return nil and p.New is non-nil, Get returns
        the result of calling p.New.
    **/
    @:native("Get") function get(): (Dynamic);
    /**
        Put adds x to the pool.
    **/
    @:native("Put") function put(x: Dynamic): Void;

}