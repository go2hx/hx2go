package go.net;

@:structInit
@:go.Type({ name: "KeepAliveConfig", instanceName: "net.KeepAliveConfig", imports: ["net"] })
extern class KeepAliveConfig {

    @:native("Enable") var enable: Bool;
    @:native("Idle") var idle: go.time.Duration;
    @:native("Interval") var interval: go.time.Duration;
    @:native("Count") var count: go.GoInt;

    function new(enable: Bool=false, idle: go.time.Duration=cast 0, interval: go.time.Duration=cast 0, count: go.GoInt=0);

}