package go.crypto.x509;

/**
    An InsecureAlgorithmError indicates that the [SignatureAlgorithm] used to
    generate the signature is not secure, and the signature has been rejected.
**/
@:go.Type({ name: "InsecureAlgorithmError", instanceName: "x509.InsecureAlgorithmError", imports: ["crypto/x509"] })
extern typedef InsecureAlgorithmError = haxe.extern.EitherType<go.GoInt, {
    @:native("Error") function error(): (String);

}>