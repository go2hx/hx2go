package go.net.http;

@:structInit
@:go.Type({ name: "readTrackingBody", instanceName: "http.readTrackingBody", imports: ["net/http"] })
extern class ReadTrackingBody {

    @:native("ReadCloser") var readCloser: go.io.ReadCloser;

    function new(readCloser: go.io.ReadCloser=null);

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(data: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}