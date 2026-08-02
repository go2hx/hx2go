package go.crypto.x509;

@:structInit
@:go.Type({ name: "basicConstraints", instanceName: "x509.basicConstraints", imports: ["crypto/x509"] })
extern class BasicConstraints {

    @:native("IsCA") var isCA: Bool;
    @:native("MaxPathLen") var maxPathLen: go.GoInt;

    function new(isCA: Bool, maxPathLen: go.GoInt);

}