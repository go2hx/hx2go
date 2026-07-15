package go.net;

@:go.Type({ name: "Error", instanceName: "net.Error", imports: ["net"] })
extern typedef Error = {

    @:native("Error") function error(): String;
    @:native("Temporary") function temporary(): Bool;
    @:native("Timeout") function timeout(): Bool;

}