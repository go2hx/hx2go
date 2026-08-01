package go.crypto.x509;

@:structInit
@:go.Type({ name: "pkixPublicKey", instanceName: "x509.pkixPublicKey", imports: ["crypto/x509"] })
extern class PkixPublicKey {

    @:native("Algo") var algo: go.crypto.x509.pkix.AlgorithmIdentifier;
    @:native("BitString") var bitString: go.encoding.asn1.BitString;

    function new(algo: go.crypto.x509.pkix.AlgorithmIdentifier, bitString: go.encoding.asn1.BitString);

}