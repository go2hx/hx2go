package go.syscall;

@:structInit
@:go.Type({ name: "DNSPTRData", instanceName: "syscall.DNSPTRData", imports: ["syscall"] })
extern class DNSPTRData {

    @:native("Host") var host: go.Pointer<go.UInt16>;

    function new(host: go.Pointer<go.UInt16>=null);

}