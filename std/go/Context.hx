package go;

/**
    Package context defines the Context type, which carries deadlines,
    cancellation signals, and other request-scoped values across API boundaries
    and between processes.
    
    Incoming requests to a server should create a [Context], and outgoing
    calls to servers should accept a Context. The chain of function
    calls between them must propagate the Context, optionally replacing
    it with a derived Context created using [WithCancel], [WithDeadline],
    [WithTimeout], or [WithValue].
    
    A Context may be canceled to indicate that work done on its behalf should stop.
    A Context with a deadline is canceled after the deadline passes.
    When a Context is canceled, all Contexts derived from it are also canceled.
    
    The [WithCancel], [WithDeadline], and [WithTimeout] functions take a
    Context (the parent) and return a derived Context (the child) and a
    [CancelFunc]. Calling the CancelFunc directly cancels the child and its
    children, removes the parent's reference to the child, and stops
    any associated timers. Failing to call the CancelFunc leaks the
    child and its children until the parent is canceled. The go vet tool
    checks that CancelFuncs are used on all control-flow paths.
    
    The [WithCancelCause], [WithDeadlineCause], and [WithTimeoutCause] functions
    return a [CancelCauseFunc], which takes an error and records it as
    the cancellation cause. Calling [Cause] on the canceled context
    or any of its children retrieves the cause. If no cause is specified,
    Cause(ctx) returns the same value as ctx.Err().
    
    Programs that use Contexts should follow these rules to keep interfaces
    consistent across packages and enable static analysis tools to check context
    propagation:
    
    Do not store Contexts inside a struct type; instead, pass a Context
    explicitly to each function that needs it. This is discussed further in
    https://go.dev/blog/context-and-structs. The Context should be the first
    parameter, typically named ctx:
    
    	func DoSomething(ctx context.Context, arg Arg) error {
    		// ... use ctx ...
    	}
    
    Do not pass a nil [Context], even if a function permits it. Pass [context.TODO]
    if you are unsure about which Context to use.
    
    Use context Values only for request-scoped data that transits processes and
    APIs, not for passing optional parameters to functions.
    
    The same Context may be passed to functions running in different goroutines;
    Contexts are safe for simultaneous use by multiple goroutines.
    
    See https://go.dev/blog/context for example code for a server that uses
    Contexts.
**/
@:go.Type({ name: "context", instanceName: "context.context", imports: ["context"] })
extern class Context {

    /**
        AfterFunc arranges to call f in its own goroutine after ctx is canceled.
        If ctx is already canceled, AfterFunc calls f immediately in its own goroutine.
        
        Multiple calls to AfterFunc on a context operate independently;
        one does not replace another.
        
        Calling the returned stop function stops the association of ctx with f.
        It returns true if the call stopped f from being run.
        If stop returns false,
        either the context is canceled and f has been started in its own goroutine;
        or f was already stopped.
        The stop function does not wait for f to complete before returning.
        If the caller needs to know whether f is completed,
        it must coordinate with f explicitly.
        
        If ctx has a "AfterFunc(func()) func() bool" method,
        AfterFunc will use it to schedule the call.
    **/
    @:native("AfterFunc") static function afterFunc(ctx: go.context.Context, f: () -> Void): (() -> (Bool));
    /**
        Background returns a non-nil, empty [Context]. It is never canceled, has no
        values, and has no deadline. It is typically used by the main function,
        initialization, and tests, and as the top-level Context for incoming
        requests.
    **/
    @:native("Background") static function background(): (go.context.Context);
    /**
        Cause returns a non-nil error explaining why c was canceled.
        The first cancellation of c or one of its parents sets the cause.
        If that cancellation happened via a call to CancelCauseFunc(err),
        then [Cause] returns err.
        Otherwise Cause(c) returns the same value as c.Err().
        Cause returns nil if c has not been canceled yet.
    **/
    @:native("Cause") static function cause(c: go.context.Context): (go.Error);
    /**
        TODO returns a non-nil, empty [Context]. Code should use context.TODO when
        it's unclear which Context to use or it is not yet available (because the
        surrounding function has not yet been extended to accept a Context
        parameter).
    **/
    @:native("TODO") static function TODO(): (go.context.Context);
    /**
        WithCancel returns a derived context that points to the parent context
        but has a new Done channel. The returned context's Done channel is closed
        when the returned cancel function is called or when the parent context's
        Done channel is closed, whichever happens first.
        
        Canceling this context releases resources associated with it, so code should
        call cancel as soon as the operations running in this [Context] complete.
    **/
    @:go.Tuple("ctx", "cancel") @:native("WithCancel") static function withCancel(parent: go.context.Context): (go.Tuple<{ ctx: go.context.Context, cancel: go.context.CancelFunc }>);
    /**
        WithCancelCause behaves like [WithCancel] but returns a [CancelCauseFunc] instead of a [CancelFunc].
        Calling cancel with a non-nil error (the "cause") records that error in ctx;
        it can then be retrieved using Cause(ctx).
        Calling cancel with nil sets the cause to Canceled.
        
        Example use:
        
        	ctx, cancel := context.WithCancelCause(parent)
        	cancel(myError)
        	ctx.Err() // returns context.Canceled
        	context.Cause(ctx) // returns myError
    **/
    @:go.Tuple("ctx", "cancel") @:native("WithCancelCause") static function withCancelCause(parent: go.context.Context): (go.Tuple<{ ctx: go.context.Context, cancel: go.context.CancelCauseFunc }>);
    /**
        WithDeadline returns a derived context that points to the parent context
        but has the deadline adjusted to be no later than d. If the parent's
        deadline is already earlier than d, WithDeadline(parent, d) is semantically
        equivalent to parent. The returned [Context.Done] channel is closed when
        the deadline expires, when the returned cancel function is called,
        or when the parent context's Done channel is closed, whichever happens first.
        
        Canceling this context releases resources associated with it, so code should
        call cancel as soon as the operations running in this [Context] complete.
    **/
    @:go.Tuple("p0", "p1") @:native("WithDeadline") static function withDeadline(parent: go.context.Context, d: go.time.Time): (go.Tuple<{ p0: go.context.Context, p1: go.context.CancelFunc }>);
    /**
        WithDeadlineCause behaves like [WithDeadline] but also sets the cause of the
        returned Context when the deadline is exceeded. The returned [CancelFunc] does
        not set the cause.
    **/
    @:go.Tuple("p0", "p1") @:native("WithDeadlineCause") static function withDeadlineCause(parent: go.context.Context, d: go.time.Time, cause: go.Error): (go.Tuple<{ p0: go.context.Context, p1: go.context.CancelFunc }>);
    /**
        WithTimeout returns WithDeadline(parent, time.Now().Add(timeout)).
        
        Canceling this context releases resources associated with it, so code should
        call cancel as soon as the operations running in this [Context] complete:
        
        	func slowOperationWithTimeout(ctx context.Context) (Result, error) {
        		ctx, cancel := context.WithTimeout(ctx, 100*time.Millisecond)
        		defer cancel()  // releases resources if slowOperation completes before timeout elapses
        		return slowOperation(ctx)
        	}
    **/
    @:go.Tuple("p0", "p1") @:native("WithTimeout") static function withTimeout(parent: go.context.Context, timeout: go.time.Duration): (go.Tuple<{ p0: go.context.Context, p1: go.context.CancelFunc }>);
    /**
        WithTimeoutCause behaves like [WithTimeout] but also sets the cause of the
        returned Context when the timeout expires. The returned [CancelFunc] does
        not set the cause.
    **/
    @:go.Tuple("p0", "p1") @:native("WithTimeoutCause") static function withTimeoutCause(parent: go.context.Context, timeout: go.time.Duration, cause: go.Error): (go.Tuple<{ p0: go.context.Context, p1: go.context.CancelFunc }>);
    /**
        WithValue returns a derived context that points to the parent Context.
        In the derived context, the value associated with key is val.
        
        Use context Values only for request-scoped data that transits processes and
        APIs, not for passing optional parameters to functions.
        
        The provided key must be comparable and should not be of type
        string or any other built-in type to avoid collisions between
        packages using context. Users of WithValue should define their own
        types for keys. To avoid allocating when assigning to an
        interface{}, context keys often have concrete type
        struct{}. Alternatively, exported context key variables' static
        type should be a pointer or interface.
    **/
    @:native("WithValue") static function withValue(parent: go.context.Context, key: Dynamic, val: Dynamic): (go.context.Context);
    /**
        WithoutCancel returns a derived context that points to the parent context
        and is not canceled when parent is canceled.
        The returned context returns no Deadline or Err, and its Done channel is nil.
        Calling [Cause] on the returned context returns nil.
    **/
    @:native("WithoutCancel") static function withoutCancel(parent: go.context.Context): (go.context.Context);

}