package go.net.http.httputil;

/**
    A BufferPool is an interface for getting and returning temporary
    byte slices for use by [io.CopyBuffer].
**/
@:go.Type({ name: "BufferPool", instanceName: "httputil.BufferPool", imports: ["net/http/httputil"] })
extern typedef BufferPool = {

    @:native("Get") function get(): (go.Slice<go.Byte>);
    @:native("Put") function put(p0: go.Slice<go.Byte>): Void;

}