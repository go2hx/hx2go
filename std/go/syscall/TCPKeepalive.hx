package go.syscall;

@:structInit
@:go.Type({ name: "TCPKeepalive", instanceName: "syscall.TCPKeepalive", imports: ["syscall"] })
extern class TCPKeepalive {

    @:native("OnOff") var onOff: go.UInt32;
    @:native("Time") var time: go.UInt32;
    @:native("Interval") var interval: go.UInt32;

    function new(onOff: go.UInt32=0, time: go.UInt32=0, interval: go.UInt32=0);

}