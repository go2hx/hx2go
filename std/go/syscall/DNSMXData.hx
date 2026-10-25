package go.syscall;

@:structInit
@:go.Type({ name: "DNSMXData", instanceName: "syscall.DNSMXData", imports: ["syscall"] })
extern class DNSMXData {

    @:native("NameExchange") var nameExchange: go.Pointer<go.UInt16>;
    @:native("Preference") var preference: go.UInt16;
    @:native("Pad") var pad: go.UInt16;

    function new(nameExchange: go.Pointer<go.UInt16>=null, preference: go.UInt16=0, pad: go.UInt16=0);

}