package go.syscall;

@:structInit
@:go.Type({ name: "CertTrustStatus", instanceName: "syscall.CertTrustStatus", imports: ["syscall"] })
extern class CertTrustStatus {

    @:native("ErrorStatus") var errorStatus: go.UInt32;
    @:native("InfoStatus") var infoStatus: go.UInt32;

    function new(errorStatus: go.UInt32=0, infoStatus: go.UInt32=0);

}