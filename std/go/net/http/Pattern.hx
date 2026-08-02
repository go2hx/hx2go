package go.net.http;

@:structInit
@:go.Type({ name: "pattern", instanceName: "http.pattern", imports: ["net/http"] })
extern class Pattern {

    @:native("String") function string(): (String);

}