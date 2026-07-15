package go.log.slog;

@:go.Type({ name: "LogValuer", instanceName: "slog.LogValuer", imports: ["log/slog"] })
extern typedef LogValuer = {

    @:native("LogValue") function logValue(): go.log.slog.Value;

}