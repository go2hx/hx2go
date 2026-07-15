package go.compress.gzip;

@:structInit
@:go.Type({ name: "Reader", instanceName: "gzip.Reader", imports: ["compress/gzip"] })
extern class Reader {

    @:native("Header") var header: go.compress.gzip.Header;

function new(header: go.compress.gzip.Header);

    @:native("Close") function close(): go.Error;
    @:native("Multistream") function multistream(ok: Bool): Void;
    @:native("Read") function read(p: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("Reset") function reset(r: go.io.Reader): go.Error;

}