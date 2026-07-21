package go.context;

@:go.Type({ name: "Context", instanceName: "context.Context", imports: ["context"] })
extern typedef Context = {

    @:go.Tuple("deadline", "ok") @:native("Deadline") function deadline(): (go.Tuple<{ deadline: go.time.Time, ok: Bool }>);
    @:native("Done") function done(): (go.Chan<Dynamic>);
    @:native("Err") function err(): (go.Error);
    @:native("Value") function value(key: Dynamic): (Dynamic);

}