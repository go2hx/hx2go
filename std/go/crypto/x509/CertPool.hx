package go.crypto.x509;

@:structInit
@:go.Type({ name: "CertPool", instanceName: "x509.CertPool", imports: ["crypto/x509"] })
extern class CertPool {

    @:native("AddCert") function addCert(cert: go.Pointer<go.crypto.x509.Certificate>): Void;
    @:native("AddCertWithConstraint") function addCertWithConstraint(cert: go.Pointer<go.crypto.x509.Certificate>, constraint: (p0: go.Slice<go.Pointer<go.crypto.x509.Certificate>>) -> go.Error): Void;
    @:native("AppendCertsFromPEM") function appendCertsFromPEM(pemCerts: go.Slice<go.Byte>): Bool;
    @:native("Clone") function clone(): go.Pointer<go.crypto.x509.CertPool>;
    @:native("Equal") function equal(other: go.Pointer<go.crypto.x509.CertPool>): Bool;
    @:native("Subjects") function subjects(): go.Slice<go.Slice<go.Byte>>;

}