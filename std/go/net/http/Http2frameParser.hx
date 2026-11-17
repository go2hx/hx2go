package go.net.http;

@:go.Type({ name: "http2frameParser", instanceName: "http.http2frameParser", imports: ["net/http"] })
extern typedef Http2frameParser = (fc: go.Pointer<go.net.http.Http2frameCache>, fh: go.net.http.Http2FrameHeader, countError: (p0: String) -> Void, payload: go.Slice<go.Byte>) -> (go.Result<go.net.http.Http2Frame>)