package go.crypto.x509.pkix;

/**
    AlgorithmIdentifier represents the ASN.1 structure of the same name. See RFC
    5280, section 4.1.1.2.
**/
@:structInit
@:go.Type({ name: "AlgorithmIdentifier", instanceName: "pkix.AlgorithmIdentifier", imports: ["crypto/x509/pkix"] })
extern class AlgorithmIdentifier {

    @:native("Algorithm") var algorithm: go.encoding.asn1.ObjectIdentifier;
    @:native("Parameters") var parameters: go.encoding.asn1.RawValue;

    function new(algorithm: go.encoding.asn1.ObjectIdentifier=null, parameters: go.encoding.asn1.RawValue);

}