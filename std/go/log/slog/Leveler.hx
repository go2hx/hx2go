package go.log.slog;

@:go.Type({ name: "Leveler", instanceName: "slog.Leveler", imports: ["log/slog"] })
extern typedef Leveler = {

    @:native("Level") function level(): go.log.slog.Level;

}