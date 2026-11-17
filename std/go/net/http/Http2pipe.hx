package go.net.http;

@:structInit
@:go.Type({ name: "http2pipe", instanceName: "http.http2pipe", imports: ["net/http"] })
extern class Http2pipe {

    @:native("BreakWithError") function breakWithError(err: go.Error): Void;
    @:native("CloseWithError") function closeWithError(err: go.Error): Void;
    @:native("Done") function done(): (go.Chan<Dynamic>);
    @:native("Err") function err(): (go.Error);
    @:native("Len") function len(): (go.GoInt);
    @:native("Read") function read(d: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("Write") function write(d: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}