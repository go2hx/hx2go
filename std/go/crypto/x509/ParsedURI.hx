package go.crypto.x509;

@:structInit
@:go.Type({ name: "parsedURI", instanceName: "x509.parsedURI", imports: ["crypto/x509"] })
extern class ParsedURI {

    @:native("String") function string(): (String);

}