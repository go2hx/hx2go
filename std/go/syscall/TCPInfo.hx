package go.syscall;

@:structInit
@:go.Type({ name: "TCPInfo", instanceName: "syscall.TCPInfo", imports: ["syscall"] })
extern class TCPInfo {

    @:native("State") var state: go.UInt8;
    @:native("Ca_state") var ca_state: go.UInt8;
    @:native("Retransmits") var retransmits: go.UInt8;
    @:native("Probes") var probes: go.UInt8;
    @:native("Backoff") var backoff: go.UInt8;
    @:native("Options") var options: go.UInt8;
    @:native("Pad_cgo_0") var pad_cgo_0: go.GoArray<go.Byte, 2>;
    @:native("Rto") var rto: go.UInt32;
    @:native("Ato") var ato: go.UInt32;
    @:native("Snd_mss") var snd_mss: go.UInt32;
    @:native("Rcv_mss") var rcv_mss: go.UInt32;
    @:native("Unacked") var unacked: go.UInt32;
    @:native("Sacked") var sacked: go.UInt32;
    @:native("Lost") var lost: go.UInt32;
    @:native("Retrans") var retrans: go.UInt32;
    @:native("Fackets") var fackets: go.UInt32;
    @:native("Last_data_sent") var last_data_sent: go.UInt32;
    @:native("Last_ack_sent") var last_ack_sent: go.UInt32;
    @:native("Last_data_recv") var last_data_recv: go.UInt32;
    @:native("Last_ack_recv") var last_ack_recv: go.UInt32;
    @:native("Pmtu") var pmtu: go.UInt32;
    @:native("Rcv_ssthresh") var rcv_ssthresh: go.UInt32;
    @:native("Rtt") var rtt: go.UInt32;
    @:native("Rttvar") var rttvar: go.UInt32;
    @:native("Snd_ssthresh") var snd_ssthresh: go.UInt32;
    @:native("Snd_cwnd") var snd_cwnd: go.UInt32;
    @:native("Advmss") var advmss: go.UInt32;
    @:native("Reordering") var reordering: go.UInt32;
    @:native("Rcv_rtt") var rcv_rtt: go.UInt32;
    @:native("Rcv_space") var rcv_space: go.UInt32;
    @:native("Total_retrans") var total_retrans: go.UInt32;

function new(state: go.UInt8, ca_state: go.UInt8, retransmits: go.UInt8, probes: go.UInt8, backoff: go.UInt8, options: go.UInt8, pad_cgo_0: go.GoArray<go.Byte, 2>, rto: go.UInt32, ato: go.UInt32, snd_mss: go.UInt32, rcv_mss: go.UInt32, unacked: go.UInt32, sacked: go.UInt32, lost: go.UInt32, retrans: go.UInt32, fackets: go.UInt32, last_data_sent: go.UInt32, last_ack_sent: go.UInt32, last_data_recv: go.UInt32, last_ack_recv: go.UInt32, pmtu: go.UInt32, rcv_ssthresh: go.UInt32, rtt: go.UInt32, rttvar: go.UInt32, snd_ssthresh: go.UInt32, snd_cwnd: go.UInt32, advmss: go.UInt32, reordering: go.UInt32, rcv_rtt: go.UInt32, rcv_space: go.UInt32, total_retrans: go.UInt32);

}