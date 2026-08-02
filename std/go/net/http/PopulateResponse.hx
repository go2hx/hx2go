package go.net.http;

@:structInit
@:go.Type({ name: "populateResponse", instanceName: "http.populateResponse", imports: ["net/http"] })
extern class PopulateResponse {

    @:native("Header") function header(): (go.net.http.Header);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("WriteHeader") function writeHeader(code: go.GoInt): Void;

}