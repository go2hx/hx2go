package go.net;

@:go.Type({ name: "Addr", instanceName: "net.Addr", imports: ["net"] })
extern typedef Addr = {

    @:native("Network") function network(): String;
    @:native("String") function string(): String;

}