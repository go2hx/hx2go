package go.syscall;

@:structInit
@:go.Type({ name: "CertSimpleChain", instanceName: "syscall.CertSimpleChain", imports: ["syscall"] })
extern class CertSimpleChain {

    @:native("Size") var size: go.UInt32;
    @:native("TrustStatus") var trustStatus: go.syscall.CertTrustStatus;
    @:native("NumElements") var numElements: go.UInt32;
    @:native("Elements") var elements: go.Pointer<go.Pointer<go.syscall.CertChainElement>>;
    @:native("TrustListInfo") var trustListInfo: go.Pointer<go.syscall.CertTrustListInfo>;
    @:native("HasRevocationFreshnessTime") var hasRevocationFreshnessTime: go.UInt32;
    @:native("RevocationFreshnessTime") var revocationFreshnessTime: go.UInt32;

    function new(size: go.UInt32=0, trustStatus: go.syscall.CertTrustStatus, numElements: go.UInt32=0, elements: go.Pointer<go.Pointer<go.syscall.CertChainElement>>=null, trustListInfo: go.Pointer<go.syscall.CertTrustListInfo>=null, hasRevocationFreshnessTime: go.UInt32=0, revocationFreshnessTime: go.UInt32=0);

}