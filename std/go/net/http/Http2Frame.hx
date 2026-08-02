package go.net.http;

@:go.Type({ name: "http2Frame", instanceName: "http.http2Frame", imports: ["net/http"] })
extern typedef Http2Frame = {

    @:native("Header") function header(): (go.net.http.Http2FrameHeader);

}