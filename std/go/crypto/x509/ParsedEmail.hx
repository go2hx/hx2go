package go.crypto.x509;

@:structInit
@:go.Type({ name: "parsedEmail", instanceName: "x509.parsedEmail", imports: ["crypto/x509"] })
extern class ParsedEmail {

    @:native("String") function string(): (String);

}