package go.testing.slogtest;

@:structInit
@:go.Type({ name: "replace", instanceName: "slogtest.replace", imports: ["testing/slogtest"] })
extern class Replace {

    @:native("LogValue") function logValue(): (go.log.slog.Value);
    @:native("String") function string(): (String);

}