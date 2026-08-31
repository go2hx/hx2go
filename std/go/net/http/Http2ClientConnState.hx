package go.net.http;

@:structInit
@:go.Type({ name: "http2ClientConnState", instanceName: "http.http2ClientConnState", imports: ["net/http"] })
extern class Http2ClientConnState {

    @:native("Closed") var closed: Bool;
    @:native("Closing") var closing: Bool;
    @:native("StreamsActive") var streamsActive: go.GoInt;
    @:native("StreamsReserved") var streamsReserved: go.GoInt;
    @:native("StreamsPending") var streamsPending: go.GoInt;
    @:native("MaxConcurrentStreams") var maxConcurrentStreams: go.UInt32;
    @:native("LastIdle") var lastIdle: go.time.Time;

    function new(closed: Bool=false, closing: Bool=false, streamsActive: go.GoInt=0, streamsReserved: go.GoInt=0, streamsPending: go.GoInt=0, maxConcurrentStreams: go.UInt32=0, lastIdle: go.time.Time);

}