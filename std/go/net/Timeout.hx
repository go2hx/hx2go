package go.net;

@:go.Type({ name: "timeout", instanceName: "net.timeout", imports: ["net"] })
extern typedef Timeout = {

    @:native("Timeout") function timeout(): (Bool);

}