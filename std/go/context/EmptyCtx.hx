package go.context;

@:structInit
@:go.Type({ name: "emptyCtx", instanceName: "context.emptyCtx", imports: ["context"] })
extern class EmptyCtx {

    @:go.Tuple("deadline", "ok") @:native("Deadline") function deadline(): (go.Tuple<{ deadline: go.time.Time, ok: Bool }>);
    @:native("Done") function done(): (go.Chan<Dynamic>);
    @:native("Err") function err(): (go.Error);
    @:native("Value") function value(key: Dynamic): (Dynamic);

}