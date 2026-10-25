package go.syscall;

@:structInit
@:go.Type({ name: "CertEnhKeyUsage", instanceName: "syscall.CertEnhKeyUsage", imports: ["syscall"] })
extern class CertEnhKeyUsage {

    @:native("Length") var length: go.UInt32;
    @:native("UsageIdentifiers") var usageIdentifiers: go.Pointer<go.Pointer<go.Byte>>;

    function new(length: go.UInt32=0, usageIdentifiers: go.Pointer<go.Pointer<go.Byte>>=null);

}