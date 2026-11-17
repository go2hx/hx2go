package go.net.http;

@:structInit
@:go.Type({ name: "http2PriorityWriteSchedulerConfig", instanceName: "http.http2PriorityWriteSchedulerConfig", imports: ["net/http"] })
extern class Http2PriorityWriteSchedulerConfig {

    @:native("MaxClosedNodesInTree") var maxClosedNodesInTree: go.GoInt;
    @:native("MaxIdleNodesInTree") var maxIdleNodesInTree: go.GoInt;
    @:native("ThrottleOutOfOrderWrites") var throttleOutOfOrderWrites: Bool;

    function new(maxClosedNodesInTree: go.GoInt=0, maxIdleNodesInTree: go.GoInt=0, throttleOutOfOrderWrites: Bool=false);

}