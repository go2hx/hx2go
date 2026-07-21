package go.context;

@:structInit
@:go.Type({ name: "timerCtx", instanceName: "context.timerCtx", imports: ["context"] })
extern class TimerCtx {

    @:native("Context") var context: go.context.Context;

    @:go.Tuple("deadline", "ok") @:native("Deadline") function deadline(): (go.Tuple<{ deadline: go.time.Time, ok: Bool }>);
    @:native("Done") function done(): (go.Chan<Dynamic>);
    @:native("Err") function err(): (go.Error);
    @:native("String") function string(): (String);
    @:native("Value") function value(key: Dynamic): (Dynamic);

}