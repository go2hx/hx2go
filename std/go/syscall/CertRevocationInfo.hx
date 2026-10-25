package go.syscall;

@:structInit
@:go.Type({ name: "CertRevocationInfo", instanceName: "syscall.CertRevocationInfo", imports: ["syscall"] })
extern class CertRevocationInfo {

    @:native("Size") var size: go.UInt32;
    @:native("RevocationResult") var revocationResult: go.UInt32;
    @:native("RevocationOid") var revocationOid: go.Pointer<go.Byte>;
    @:native("OidSpecificInfo") var oidSpecificInfo: go.syscall.Pointer;
    @:native("HasFreshnessTime") var hasFreshnessTime: go.UInt32;
    @:native("FreshnessTime") var freshnessTime: go.UInt32;
    @:native("CrlInfo") var crlInfo: go.Pointer<go.syscall.CertRevocationCrlInfo>;

    function new(size: go.UInt32=0, revocationResult: go.UInt32=0, revocationOid: go.Pointer<go.Byte>=null, oidSpecificInfo: go.syscall.Pointer=null, hasFreshnessTime: go.UInt32=0, freshnessTime: go.UInt32=0, crlInfo: go.Pointer<go.syscall.CertRevocationCrlInfo>=null);

}