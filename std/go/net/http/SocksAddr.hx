package go.net.http;

@:structInit
@:go.Type({ name: "socksAddr", instanceName: "http.socksAddr", imports: ["net/http"] })
extern class SocksAddr {

    @:native("Name") var name: String;
    @:native("IP") var IP: go.net.IP;
    @:native("Port") var port: go.GoInt;

    function new(name: String, IP: go.net.IP, port: go.GoInt);

    @:native("Network") function network(): (String);
    @:native("String") function string(): (String);

}