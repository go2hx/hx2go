package go;

@:go.Type({ name: "plugin", instanceName: "plugin.plugin", imports: ["plugin"] })
extern class Plugin {

    @:native("Open") static function open(path: String): go.Result<go.Pointer<go.plugin.Plugin>>;

}