package go.sync;

/**
    Cond implements a condition variable, a rendezvous point
    for goroutines waiting for or announcing the occurrence
    of an event.
    
    Each Cond has an associated Locker L (often a [*Mutex] or [*RWMutex]),
    which must be held when changing the condition and
    when calling the [Cond.Wait] method.
    
    A Cond must not be copied after first use.
    
    In the terminology of [the Go memory model], Cond arranges that
    a call to [Cond.Broadcast] or [Cond.Signal] “synchronizes before” any Wait call
    that it unblocks.
    
    For many simple use cases, users will be better off using channels than a
    Cond (Broadcast corresponds to closing a channel, and Signal corresponds to
    sending on a channel).
    
    For more on replacements for [sync.Cond], see [Roberto Clapis's series on
    advanced concurrency patterns], as well as [Bryan Mills's talk on concurrency
    patterns].
    
    [the Go memory model]: https://go.dev/ref/mem
    [Roberto Clapis's series on advanced concurrency patterns]: https://blogtitle.github.io/categories/concurrency/
    [Bryan Mills's talk on concurrency patterns]: https://drive.google.com/file/d/1nPdvhB0PutEJzdCq5ms6UI58dp50fcAN/view
**/
@:structInit
@:go.Type({ name: "Cond", instanceName: "sync.Cond", imports: ["sync"] })
extern class Cond {

    @:native("L") var L: go.sync.Locker;

    function new(L: go.sync.Locker=null);

    /**
        Broadcast wakes all goroutines waiting on c.
        
        It is allowed but not required for the caller to hold c.L
        during the call.
    **/
    @:native("Broadcast") function broadcast(): Void;
    /**
        Signal wakes one goroutine waiting on c, if there is any.
        
        It is allowed but not required for the caller to hold c.L
        during the call.
        
        Signal() does not affect goroutine scheduling priority; if other goroutines
        are attempting to lock c.L, they may be awoken before a "waiting" goroutine.
    **/
    @:native("Signal") function signal(): Void;
    /**
        Wait atomically unlocks c.L and suspends execution
        of the calling goroutine. After later resuming execution,
        Wait locks c.L before returning. Unlike in other systems,
        Wait cannot return unless awoken by [Cond.Broadcast] or [Cond.Signal].
        
        Because c.L is not locked while Wait is waiting, the caller
        typically cannot assume that the condition is true when
        Wait returns. Instead, the caller should Wait in a loop:
        
        	c.L.Lock()
        	for !condition() {
        	    c.Wait()
        	}
        	... make use of condition ...
        	c.L.Unlock()
    **/
    @:native("Wait") function wait(): Void;

}