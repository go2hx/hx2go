package go.log.slog;

/**
    A Leveler provides a [Level] value.
    
    As Level itself implements Leveler, clients typically supply
    a Level value wherever a Leveler is needed, such as in [HandlerOptions].
    Clients who need to vary the level dynamically can provide a more complex
    Leveler implementation such as *[LevelVar].
**/
@:go.Type({ name: "Leveler", instanceName: "slog.Leveler", imports: ["log/slog"] })
extern typedef Leveler = {

    @:native("Level") function level(): (go.log.slog.Level);

}