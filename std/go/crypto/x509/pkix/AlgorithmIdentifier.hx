package go.crypto.x509.pkix;

@:structInit
@:go.Type({ name: "AlgorithmIdentifier", instanceName: "pkix.AlgorithmIdentifier", imports: ["crypto/x509/pkix"] })
extern class AlgorithmIdentifier {

    @:native("Algorithm") var algorithm: go.encoding.asn1.ObjectIdentifier;
    @:native("Parameters") var parameters: go.encoding.asn1.RawValue;

function new(algorithm: go.encoding.asn1.ObjectIdentifier, parameters: go.encoding.asn1.RawValue);

}