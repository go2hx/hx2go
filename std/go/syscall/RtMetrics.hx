package go.syscall;

@:structInit
@:go.Type({ name: "RtMetrics", instanceName: "syscall.RtMetrics", imports: ["syscall"] })
extern class RtMetrics {

    @:native("Locks") var locks: go.UInt32;
    @:native("Mtu") var mtu: go.UInt32;
    @:native("Hopcount") var hopcount: go.UInt32;
    @:native("Expire") var expire: go.Int32;
    @:native("Recvpipe") var recvpipe: go.UInt32;
    @:native("Sendpipe") var sendpipe: go.UInt32;
    @:native("Ssthresh") var ssthresh: go.UInt32;
    @:native("Rtt") var rtt: go.UInt32;
    @:native("Rttvar") var rttvar: go.UInt32;
    @:native("Pksent") var pksent: go.UInt32;
    @:native("Filler") var filler: go.GoArray<go.UInt32, 4>;

    function new(locks: go.UInt32, mtu: go.UInt32, hopcount: go.UInt32, expire: go.Int32, recvpipe: go.UInt32, sendpipe: go.UInt32, ssthresh: go.UInt32, rtt: go.UInt32, rttvar: go.UInt32, pksent: go.UInt32, filler: go.GoArray<go.UInt32, 4>);

}