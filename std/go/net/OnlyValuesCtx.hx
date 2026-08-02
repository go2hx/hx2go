package go.net;

@:structInit
@:go.Type({ name: "onlyValuesCtx", instanceName: "net.onlyValuesCtx", imports: ["net"] })
extern class OnlyValuesCtx {

    @:native("Context") var context: go.context.Context;

    function new(context: go.context.Context);

    @:go.Tuple("deadline", "ok") @:native("Deadline") function deadline(): (go.Tuple<{ deadline: go.time.Time, ok: Bool }>);
    @:native("Done") function done(): (go.Chan<Dynamic>);
    @:native("Err") function err(): (go.Error);
    @:native("Value") function value(key: Dynamic): (Dynamic);

}