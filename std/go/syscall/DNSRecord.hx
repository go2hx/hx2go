package go.syscall;

@:structInit
@:go.Type({ name: "DNSRecord", instanceName: "syscall.DNSRecord", imports: ["syscall"] })
extern class DNSRecord {

    @:native("Next") var next: go.Pointer<go.syscall.DNSRecord>;
    @:native("Name") var name: go.Pointer<go.UInt16>;
    @:native("Type") var type: go.UInt16;
    @:native("Length") var length: go.UInt16;
    @:native("Dw") var dw: go.UInt32;
    @:native("Ttl") var ttl: go.UInt32;
    @:native("Reserved") var reserved: go.UInt32;
    @:native("Data") var data: go.GoArray<go.Byte, 40>;

    function new(next: go.Pointer<go.syscall.DNSRecord>=null, name: go.Pointer<go.UInt16>=null, type: go.UInt16=0, length: go.UInt16=0, dw: go.UInt32=0, ttl: go.UInt32=0, reserved: go.UInt32=0, data: go.GoArray<go.Byte, 40>);

}