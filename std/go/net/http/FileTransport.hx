package go.net.http;

@:structInit
@:go.Type({ name: "fileTransport", instanceName: "http.fileTransport", imports: ["net/http"] })
extern class FileTransport {

    @:native("RoundTrip") function roundTrip(req: go.Pointer<go.net.http.Request>): (go.Result<go.Pointer<go.net.http.Response>>);

}