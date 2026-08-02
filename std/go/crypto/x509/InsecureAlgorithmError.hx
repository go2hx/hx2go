package go.crypto.x509;

@:go.Type({ name: "InsecureAlgorithmError", instanceName: "x509.InsecureAlgorithmError", imports: ["crypto/x509"] })
extern typedef InsecureAlgorithmError = haxe.extern.EitherType<go.GoInt, {
    @:native("Error") function error(): (String);

}>