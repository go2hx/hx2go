package go.crypto.tls;

@:go.Type({ name: "ClientAuthType", instanceName: "tls.ClientAuthType", imports: ["crypto/tls"] })
extern typedef ClientAuthType = haxe.extern.EitherType<go.GoInt, {
    @:native("String") function string(): (String);

}>