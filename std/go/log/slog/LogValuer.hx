package go.log.slog;

/**
    A LogValuer is any Go value that can convert itself into a Value for logging.
    
    This mechanism may be used to defer expensive operations until they are
    needed, or to expand a single value into a sequence of components.
**/
@:go.Type({ name: "LogValuer", instanceName: "slog.LogValuer", imports: ["log/slog"] })
extern typedef LogValuer = {

    @:native("LogValue") function logValue(): (go.log.slog.Value);

}