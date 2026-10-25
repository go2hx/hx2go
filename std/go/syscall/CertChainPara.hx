package go.syscall;

@:structInit
@:go.Type({ name: "CertChainPara", instanceName: "syscall.CertChainPara", imports: ["syscall"] })
extern class CertChainPara {

    @:native("Size") var size: go.UInt32;
    @:native("RequestedUsage") var requestedUsage: go.syscall.CertUsageMatch;
    @:native("RequstedIssuancePolicy") var requstedIssuancePolicy: go.syscall.CertUsageMatch;
    @:native("URLRetrievalTimeout") var uRLRetrievalTimeout: go.UInt32;
    @:native("CheckRevocationFreshnessTime") var checkRevocationFreshnessTime: go.UInt32;
    @:native("RevocationFreshnessTime") var revocationFreshnessTime: go.UInt32;
    @:native("CacheResync") var cacheResync: go.Pointer<go.syscall.Filetime>;

    function new(size: go.UInt32=0, requestedUsage: go.syscall.CertUsageMatch, requstedIssuancePolicy: go.syscall.CertUsageMatch, uRLRetrievalTimeout: go.UInt32=0, checkRevocationFreshnessTime: go.UInt32=0, revocationFreshnessTime: go.UInt32=0, cacheResync: go.Pointer<go.syscall.Filetime>=null);

}