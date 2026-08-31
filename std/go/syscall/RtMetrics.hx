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

    function new(locks: go.UInt32=0, mtu: go.UInt32=0, hopcount: go.UInt32=0, expire: go.Int32=0, recvpipe: go.UInt32=0, sendpipe: go.UInt32=0, ssthresh: go.UInt32=0, rtt: go.UInt32=0, rttvar: go.UInt32=0, pksent: go.UInt32=0, filler: go.GoArray<go.UInt32, 4>);

}