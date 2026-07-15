package go.plugin;

@:structInit
@:go.Type({ name: "Plugin", instanceName: "plugin.Plugin", imports: ["plugin"] })
extern class Plugin {

    @:native("Lookup") function lookup(symName: String): go.Result<go.plugin.Symbol>;

}