package go.net.url;

@:structInit
@:go.Type({ name: "Error", instanceName: "url.Error", imports: ["net/url"] })
extern class Error {

    @:native("Op") var op: String;
    @:native("URL") var URL: String;
    @:native("Err") var err: go.Error;

function new(op: String, URL: String, err: go.Error);

    @:native("Error") function error(): String;
    @:native("Temporary") function temporary(): Bool;
    @:native("Timeout") function timeout(): Bool;
    @:native("Unwrap") function unwrap(): go.Error;

}