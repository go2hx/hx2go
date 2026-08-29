package go.context;

/**
    A Context carries a deadline, a cancellation signal, and other values across
    API boundaries.
    
    Context's methods may be called by multiple goroutines simultaneously.
**/
@:go.Type({ name: "Context", instanceName: "context.Context", imports: ["context"] })
extern typedef Context = {

    @:go.Tuple("deadline", "ok") @:native("Deadline") function deadline(): (go.Tuple<{ deadline: go.time.Time, ok: Bool }>);
    @:native("Done") function done(): (go.Chan<Dynamic>);
    @:native("Err") function err(): (go.Error);
    @:native("Value") function value(key: Dynamic): (Dynamic);

}