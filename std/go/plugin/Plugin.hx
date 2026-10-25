package go.plugin;

/**
    Plugin is a loaded Go plugin.
**/
@:structInit
@:go.Type({ name: "Plugin", instanceName: "plugin.Plugin", imports: ["plugin"] })
extern class Plugin {

    /**
        Lookup searches for a symbol named symName in plugin p.
        A symbol is any exported variable or function.
        It reports an error if the symbol is not found.
        It is safe for concurrent use by multiple goroutines.
    **/
    @:native("Lookup") function lookup(symName: String): (go.Result<go.plugin.Symbol>);

}