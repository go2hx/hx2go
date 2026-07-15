package go.crypto.x509.pkix;

@:go.Type({ name: "RDNSequence", instanceName: "pkix.RDNSequence", imports: ["crypto/x509/pkix"] })
extern class RDNSequence {

    @:native("String") function string(): String;

}