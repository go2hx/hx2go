package go.crypto.x509;

/**
    RevocationListEntry represents an entry in the revokedCertificates
    sequence of a CRL.
**/
@:structInit
@:go.Type({ name: "RevocationListEntry", instanceName: "x509.RevocationListEntry", imports: ["crypto/x509"] })
extern class RevocationListEntry {

    @:native("Raw") var raw: go.Slice<go.Byte>;
    @:native("SerialNumber") var serialNumber: go.Pointer<go.math.big.Int>;
    @:native("RevocationTime") var revocationTime: go.time.Time;
    @:native("ReasonCode") var reasonCode: go.GoInt;
    @:native("Extensions") var extensions: go.Slice<go.crypto.x509.pkix.Extension>;
    @:native("ExtraExtensions") var extraExtensions: go.Slice<go.crypto.x509.pkix.Extension>;

    function new(raw: go.Slice<go.Byte>=null, serialNumber: go.Pointer<go.math.big.Int>=null, revocationTime: go.time.Time, reasonCode: go.GoInt=0, extensions: go.Slice<go.crypto.x509.pkix.Extension>=null, extraExtensions: go.Slice<go.crypto.x509.pkix.Extension>=null);

}