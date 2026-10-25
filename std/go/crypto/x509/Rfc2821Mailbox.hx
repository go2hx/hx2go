package go.crypto.x509;

@:structInit
@:go.Type({ name: "rfc2821Mailbox", instanceName: "x509.rfc2821Mailbox", imports: ["crypto/x509"] })
extern class Rfc2821Mailbox {

    @:native("String") function string(): (String);

}