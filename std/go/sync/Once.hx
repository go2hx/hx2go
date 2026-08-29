package go.sync;

/**
    Once is an object that will perform exactly one action.
    
    A Once must not be copied after first use.
    
    In the terminology of [the Go memory model],
    the return from f “synchronizes before”
    the return from any call of once.Do(f).
    
    [the Go memory model]: https://go.dev/ref/mem
**/
@:structInit
@:go.Type({ name: "Once", instanceName: "sync.Once", imports: ["sync"] })
extern class Once {

    /**
        Do calls the function f if and only if Do is being called for the
        first time for this instance of [Once]. In other words, given
        
        	var once Once
        
        if once.Do(f) is called multiple times, only the first call will invoke f,
        even if f has a different value in each invocation. A new instance of
        Once is required for each function to execute.
        
        Do is intended for initialization that must be run exactly once. Since f
        is niladic, it may be necessary to use a function literal to capture the
        arguments to a function to be invoked by Do:
        
        	config.once.Do(func() { config.init(filename) })
        
        Because no call to Do returns until the one call to f returns, if f causes
        Do to be called, it will deadlock.
        
        If f panics, Do considers it to have returned; future calls of Do return
        without calling f.
    **/
    @:native("Do") function _do(f: () -> Void): Void;

}