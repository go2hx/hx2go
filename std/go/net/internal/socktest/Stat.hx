package go.net.internal.socktest;

@:structInit
@:go.Type({ name: "Stat", instanceName: "socktest.Stat", imports: ["net/internal/socktest"] })
extern class Stat {

    @:native("Family") var family: go.GoInt;
    @:native("Type") var type: go.GoInt;
    @:native("Protocol") var protocol: go.GoInt;
    @:native("Opened") var opened: go.UInt64;
    @:native("Connected") var connected: go.UInt64;
    @:native("Listened") var listened: go.UInt64;
    @:native("Accepted") var accepted: go.UInt64;
    @:native("Closed") var closed: go.UInt64;
    @:native("OpenFailed") var openFailed: go.UInt64;
    @:native("ConnectFailed") var connectFailed: go.UInt64;
    @:native("ListenFailed") var listenFailed: go.UInt64;
    @:native("AcceptFailed") var acceptFailed: go.UInt64;
    @:native("CloseFailed") var closeFailed: go.UInt64;

function new(family: go.GoInt, type: go.GoInt, protocol: go.GoInt, opened: go.UInt64, connected: go.UInt64, listened: go.UInt64, accepted: go.UInt64, closed: go.UInt64, openFailed: go.UInt64, connectFailed: go.UInt64, listenFailed: go.UInt64, acceptFailed: go.UInt64, closeFailed: go.UInt64);

    @:native("String") function string(): String;

}