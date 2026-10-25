package go.syscall;

@:structInit
@:go.Type({ name: "CertChainContext", instanceName: "syscall.CertChainContext", imports: ["syscall"] })
extern class CertChainContext {

    @:native("Size") var size: go.UInt32;
    @:native("TrustStatus") var trustStatus: go.syscall.CertTrustStatus;
    @:native("ChainCount") var chainCount: go.UInt32;
    @:native("Chains") var chains: go.Pointer<go.Pointer<go.syscall.CertSimpleChain>>;
    @:native("LowerQualityChainCount") var lowerQualityChainCount: go.UInt32;
    @:native("LowerQualityChains") var lowerQualityChains: go.Pointer<go.Pointer<go.syscall.CertChainContext>>;
    @:native("HasRevocationFreshnessTime") var hasRevocationFreshnessTime: go.UInt32;
    @:native("RevocationFreshnessTime") var revocationFreshnessTime: go.UInt32;

    function new(size: go.UInt32=0, trustStatus: go.syscall.CertTrustStatus, chainCount: go.UInt32=0, chains: go.Pointer<go.Pointer<go.syscall.CertSimpleChain>>=null, lowerQualityChainCount: go.UInt32=0, lowerQualityChains: go.Pointer<go.Pointer<go.syscall.CertChainContext>>=null, hasRevocationFreshnessTime: go.UInt32=0, revocationFreshnessTime: go.UInt32=0);

}