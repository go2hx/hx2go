package go.log.slog;

@:go.Type({ name: "internal", instanceName: "internal.internal", imports: ["log/slog/internal"] })
extern class Internal {

    @:native("IgnorePC") static var IgnorePC: Bool;

}