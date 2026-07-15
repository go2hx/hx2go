package go.net;

@:structInit
@:go.Type({ name: "KeepAliveConfig", instanceName: "net.KeepAliveConfig", imports: ["net"] })
extern class KeepAliveConfig {

    @:native("Enable") var enable: Bool;
    @:native("Idle") var idle: go.time.Duration;
    @:native("Interval") var interval: go.time.Duration;
    @:native("Count") var count: go.GoInt;

function new(enable: Bool, idle: go.time.Duration, interval: go.time.Duration, count: go.GoInt);

}