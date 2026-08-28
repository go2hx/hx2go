package go.crypto.x509.pkix;

@:go.Type({ name: "RDNSequence", instanceName: "pkix.RDNSequence", imports: ["crypto/x509/pkix"] })
extern class RDNSequence {

    /**
        String returns a string representation of the sequence r,
        roughly following the RFC 2253 Distinguished Names syntax.
    **/
    @:native("String") function string(): (String);

}