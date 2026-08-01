package go.os.signal;

@:structInit
@:go.Type({ name: "signalCtx", instanceName: "signal.signalCtx", imports: ["os/signal"] })
extern class SignalCtx {

    @:native("Context") var context: go.context.Context;

    function new(context: go.context.Context);

    @:go.Tuple("deadline", "ok") @:native("Deadline") function deadline(): (go.Tuple<{ deadline: go.time.Time, ok: Bool }>);
    @:native("Done") function done(): (go.Chan<Dynamic>);
    @:native("Err") function err(): (go.Error);
    @:native("String") function string(): (String);
    @:native("Value") function value(key: Dynamic): (Dynamic);

}