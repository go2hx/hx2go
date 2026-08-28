package go.net;

/**
    KeepAliveConfig contains TCP keep-alive options.
    
    If the Idle, Interval, or Count fields are zero, a default value is chosen.
    If a field is negative, the corresponding socket-level option will be left unchanged.
    
    Note that prior to Windows 10 version 1709, neither setting Idle and Interval
    separately nor changing Count (which is usually 10) is supported.
    Therefore, it's recommended to set both Idle and Interval to non-negative values
    in conjunction with a -1 for Count on those old Windows if you intend to customize
    the TCP keep-alive settings.
    By contrast, if only one of Idle and Interval is set to a non-negative value,
    the other will be set to the system default value, and ultimately,
    set both Idle and Interval to negative values if you want to leave them unchanged.
    
    Note that Solaris and its derivatives do not support setting Interval to a non-negative value
    and Count to a negative value, or vice-versa.
**/
@:structInit
@:go.Type({ name: "KeepAliveConfig", instanceName: "net.KeepAliveConfig", imports: ["net"] })
extern class KeepAliveConfig {

    @:native("Enable") var enable: Bool;
    @:native("Idle") var idle: go.time.Duration;
    @:native("Interval") var interval: go.time.Duration;
    @:native("Count") var count: go.GoInt;

    function new(enable: Bool=false, idle: go.time.Duration=cast 0, interval: go.time.Duration=cast 0, count: go.GoInt=0);

}