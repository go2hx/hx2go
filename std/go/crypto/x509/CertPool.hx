package go.crypto.x509;

/**
    CertPool is a set of certificates.
**/
@:structInit
@:go.Type({ name: "CertPool", instanceName: "x509.CertPool", imports: ["crypto/x509"] })
extern class CertPool {

    /**
        AddCert adds a certificate to a pool.
    **/
    @:native("AddCert") function addCert(cert: go.Pointer<go.crypto.x509.Certificate>): Void;
    /**
        AddCertWithConstraint adds a certificate to the pool with the additional
        constraint. When Certificate.Verify builds a chain which is rooted by cert,
        it will additionally pass the whole chain to constraint to determine its
        validity. If constraint returns a non-nil error, the chain will be discarded.
        constraint may be called concurrently from multiple goroutines.
    **/
    @:native("AddCertWithConstraint") function addCertWithConstraint(cert: go.Pointer<go.crypto.x509.Certificate>, constraint: (p0: go.Slice<go.Pointer<go.crypto.x509.Certificate>>) -> (go.Error)): Void;
    /**
        AppendCertsFromPEM attempts to parse a series of PEM encoded certificates.
        It appends any certificates found to s and reports whether any certificates
        were successfully parsed.
        
        On many Linux systems, /etc/ssl/cert.pem will contain the system wide set
        of root CAs in a format suitable for this function.
    **/
    @:native("AppendCertsFromPEM") function appendCertsFromPEM(pemCerts: go.Slice<go.Byte>): (Bool);
    /**
        Clone returns a copy of s.
    **/
    @:native("Clone") function clone(): (go.Pointer<go.crypto.x509.CertPool>);
    /**
        Equal reports whether s and other are equal.
    **/
    @:native("Equal") function equal(other: go.Pointer<go.crypto.x509.CertPool>): (Bool);
    /**
        Subjects returns a list of the DER-encoded subjects of
        all of the certificates in the pool.
        
        Deprecated: if s was returned by [SystemCertPool], Subjects
        will not include the system roots.
    **/
    @:native("Subjects") function subjects(): (go.Slice<go.Slice<go.Byte>>);

}