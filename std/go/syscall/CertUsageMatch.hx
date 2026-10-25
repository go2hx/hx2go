package go.syscall;

@:structInit
@:go.Type({ name: "CertUsageMatch", instanceName: "syscall.CertUsageMatch", imports: ["syscall"] })
extern class CertUsageMatch {

    @:native("Type") var type: go.UInt32;
    @:native("Usage") var usage: go.syscall.CertEnhKeyUsage;

    function new(type: go.UInt32=0, usage: go.syscall.CertEnhKeyUsage);

}