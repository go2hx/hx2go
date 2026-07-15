package go.crypto.x509;

@:structInit
@:go.Type({ name: "RevocationListEntry", instanceName: "x509.RevocationListEntry", imports: ["crypto/x509"] })
extern class RevocationListEntry {

    @:native("Raw") var raw: go.Slice<go.Byte>;
    @:native("SerialNumber") var serialNumber: go.Pointer<go.math.big.Int>;
    @:native("RevocationTime") var revocationTime: go.time.Time;
    @:native("ReasonCode") var reasonCode: go.GoInt;
    @:native("Extensions") var extensions: go.Slice<go.crypto.x509.pkix.Extension>;
    @:native("ExtraExtensions") var extraExtensions: go.Slice<go.crypto.x509.pkix.Extension>;

function new(raw: go.Slice<go.Byte>, serialNumber: go.Pointer<go.math.big.Int>, revocationTime: go.time.Time, reasonCode: go.GoInt, extensions: go.Slice<go.crypto.x509.pkix.Extension>, extraExtensions: go.Slice<go.crypto.x509.pkix.Extension>);

}