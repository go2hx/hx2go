package go.crypto.x509.pkix;

@:structInit
@:go.Type({ name: "RevokedCertificate", instanceName: "pkix.RevokedCertificate", imports: ["crypto/x509/pkix"] })
extern class RevokedCertificate {

    @:native("SerialNumber") var serialNumber: go.Pointer<go.math.big.Int>;
    @:native("RevocationTime") var revocationTime: go.time.Time;
    @:native("Extensions") var extensions: go.Slice<go.crypto.x509.pkix.Extension>;

function new(serialNumber: go.Pointer<go.math.big.Int>, revocationTime: go.time.Time, extensions: go.Slice<go.crypto.x509.pkix.Extension>);

}