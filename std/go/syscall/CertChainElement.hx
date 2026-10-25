package go.syscall;

@:structInit
@:go.Type({ name: "CertChainElement", instanceName: "syscall.CertChainElement", imports: ["syscall"] })
extern class CertChainElement {

    @:native("Size") var size: go.UInt32;
    @:native("CertContext") var certContext: go.Pointer<go.syscall.CertContext>;
    @:native("TrustStatus") var trustStatus: go.syscall.CertTrustStatus;
    @:native("RevocationInfo") var revocationInfo: go.Pointer<go.syscall.CertRevocationInfo>;
    @:native("IssuanceUsage") var issuanceUsage: go.Pointer<go.syscall.CertEnhKeyUsage>;
    @:native("ApplicationUsage") var applicationUsage: go.Pointer<go.syscall.CertEnhKeyUsage>;
    @:native("ExtendedErrorInfo") var extendedErrorInfo: go.Pointer<go.UInt16>;

    function new(size: go.UInt32=0, certContext: go.Pointer<go.syscall.CertContext>=null, trustStatus: go.syscall.CertTrustStatus, revocationInfo: go.Pointer<go.syscall.CertRevocationInfo>=null, issuanceUsage: go.Pointer<go.syscall.CertEnhKeyUsage>=null, applicationUsage: go.Pointer<go.syscall.CertEnhKeyUsage>=null, extendedErrorInfo: go.Pointer<go.UInt16>=null);

}