package go.crypto.tls;

/**
    ClientAuthType declares the policy the server will follow for
    TLS Client Authentication.
**/
@:go.Type({ name: "ClientAuthType", instanceName: "tls.ClientAuthType", imports: ["crypto/tls"] })
extern typedef ClientAuthType = haxe.extern.EitherType<go.GoInt, {
    @:native("String") function string(): (String);

}>