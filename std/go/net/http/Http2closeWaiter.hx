package go.net.http;

@:go.Type({ name: "http2closeWaiter", instanceName: "http.http2closeWaiter", imports: ["net/http"] })
extern class Http2closeWaiter {

    @:native("Close") function close(): Void;
    @:native("Init") function init(): Void;
    @:native("Wait") function wait(): Void;

}