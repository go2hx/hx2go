package go.crypto.x509.pkix;

@:structInit
@:go.Type({ name: "Extension", instanceName: "pkix.Extension", imports: ["crypto/x509/pkix"] })
extern class Extension {

    @:native("Id") var id: go.encoding.asn1.ObjectIdentifier;
    @:native("Critical") var critical: Bool;
    @:native("Value") var value: go.Slice<go.Byte>;

    function new(id: go.encoding.asn1.ObjectIdentifier=null, critical: Bool=false, value: go.Slice<go.Byte>=null);

}