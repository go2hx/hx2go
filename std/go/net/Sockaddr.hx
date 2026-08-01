package go.net;

@:go.Type({ name: "sockaddr", instanceName: "net.sockaddr", imports: ["net"] })
extern typedef Sockaddr = {

    @:native("Network") function network(): (String);
    @:native("String") function string(): (String);

}