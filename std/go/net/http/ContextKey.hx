package go.net.http;

@:structInit
@:go.Type({ name: "contextKey", instanceName: "http.contextKey", imports: ["net/http"] })
extern class ContextKey {

    @:native("String") function string(): (String);

}