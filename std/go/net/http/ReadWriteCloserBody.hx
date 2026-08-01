package go.net.http;

@:structInit
@:go.Type({ name: "readWriteCloserBody", instanceName: "http.readWriteCloserBody", imports: ["net/http"] })
extern class ReadWriteCloserBody {

    @:native("ReadWriteCloser") var readWriteCloser: go.io.ReadWriteCloser;

    function new(readWriteCloser: go.io.ReadWriteCloser);

    @:native("Close") function close(): (go.Error);
    @:native("CloseWrite") function closeWrite(): (go.Error);
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}