package go.context;

@:structInit
@:go.Type({ name: "withoutCancelCtx", instanceName: "context.withoutCancelCtx", imports: ["context"] })
extern class WithoutCancelCtx {

    @:go.Tuple("deadline", "ok") @:native("Deadline") function deadline(): (go.Tuple<{ deadline: go.time.Time, ok: Bool }>);
    @:native("Done") function done(): (go.Chan<Dynamic>);
    @:native("Err") function err(): (go.Error);
    @:native("String") function string(): (String);
    @:native("Value") function value(key: Dynamic): (Dynamic);

}