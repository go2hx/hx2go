package go.crypto.x509;

@:structInit
@:go.Type({ name: "pkcs8", instanceName: "x509.pkcs8", imports: ["crypto/x509"] })
extern class Pkcs8 {

    @:native("Version") var version: go.GoInt;
    @:native("Algo") var algo: go.crypto.x509.pkix.AlgorithmIdentifier;
    @:native("PrivateKey") var privateKey: go.Slice<go.Byte>;

    function new(version: go.GoInt=0, algo: go.crypto.x509.pkix.AlgorithmIdentifier, privateKey: go.Slice<go.Byte>=null);

}