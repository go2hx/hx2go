package go.crypto.x509;

@:structInit
@:go.Type({ name: "VerifyOptions", instanceName: "x509.VerifyOptions", imports: ["crypto/x509"] })
extern class VerifyOptions {

    @:native("DNSName") var dNSName: String;
    @:native("Intermediates") var intermediates: go.Pointer<go.crypto.x509.CertPool>;
    @:native("Roots") var roots: go.Pointer<go.crypto.x509.CertPool>;
    @:native("CurrentTime") var currentTime: go.time.Time;
    @:native("KeyUsages") var keyUsages: go.Slice<go.crypto.x509.ExtKeyUsage>;
    @:native("MaxConstraintComparisions") var maxConstraintComparisions: go.GoInt;
    @:native("CertificatePolicies") var certificatePolicies: go.Slice<go.crypto.x509.OID>;

function new(dNSName: String, intermediates: go.Pointer<go.crypto.x509.CertPool>, roots: go.Pointer<go.crypto.x509.CertPool>, currentTime: go.time.Time, keyUsages: go.Slice<go.crypto.x509.ExtKeyUsage>, maxConstraintComparisions: go.GoInt, certificatePolicies: go.Slice<go.crypto.x509.OID>);

}