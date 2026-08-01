package go.crypto.x509;

@:structInit
@:go.Type({ name: "validity", instanceName: "x509.validity", imports: ["crypto/x509"] })
extern class Validity {

    @:native("NotBefore") var notBefore: go.time.Time;
    @:native("NotAfter") var notAfter: go.time.Time;

    function new(notBefore: go.time.Time, notAfter: go.time.Time);

}