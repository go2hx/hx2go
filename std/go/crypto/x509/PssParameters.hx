package go.crypto.x509;

@:structInit
@:go.Type({ name: "pssParameters", instanceName: "x509.pssParameters", imports: ["crypto/x509"] })
extern class PssParameters {

    @:native("Hash") var hash: go.crypto.x509.pkix.AlgorithmIdentifier;
    @:native("MGF") var MGF: go.crypto.x509.pkix.AlgorithmIdentifier;
    @:native("SaltLength") var saltLength: go.GoInt;
    @:native("TrailerField") var trailerField: go.GoInt;

    function new(hash: go.crypto.x509.pkix.AlgorithmIdentifier, MGF: go.crypto.x509.pkix.AlgorithmIdentifier, saltLength: go.GoInt=0, trailerField: go.GoInt=0);

}