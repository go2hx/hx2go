package go.crypto.x509;

@:structInit
@:go.Type({ name: "ecPrivateKey", instanceName: "x509.ecPrivateKey", imports: ["crypto/x509"] })
extern class EcPrivateKey {

    @:native("Version") var version: go.GoInt;
    @:native("PrivateKey") var privateKey: go.Slice<go.Byte>;
    @:native("NamedCurveOID") var namedCurveOID: go.encoding.asn1.ObjectIdentifier;
    @:native("PublicKey") var publicKey: go.encoding.asn1.BitString;

    function new(version: go.GoInt=0, privateKey: go.Slice<go.Byte>=null, namedCurveOID: go.encoding.asn1.ObjectIdentifier=null, publicKey: go.encoding.asn1.BitString);

}