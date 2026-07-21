package go.syscall;

@:structInit
@:go.Type({ name: "BpfHdr", instanceName: "syscall.BpfHdr", imports: ["syscall"] })
extern class BpfHdr {

    @:native("Tstamp") var tstamp: go.syscall.Timeval32;
    @:native("Caplen") var caplen: go.UInt32;
    @:native("Datalen") var datalen: go.UInt32;
    @:native("Hdrlen") var hdrlen: go.UInt16;
    @:native("Pad_cgo_0") var pad_cgo_0: go.GoArray<go.Byte, 2>;

    function new(tstamp: go.syscall.Timeval32, caplen: go.UInt32, datalen: go.UInt32, hdrlen: go.UInt16, pad_cgo_0: go.GoArray<go.Byte, 2>);

}