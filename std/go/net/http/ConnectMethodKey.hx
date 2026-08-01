package go.net.http;

@:structInit
@:go.Type({ name: "connectMethodKey", instanceName: "http.connectMethodKey", imports: ["net/http"] })
extern class ConnectMethodKey {

    @:native("String") function string(): (String);

}