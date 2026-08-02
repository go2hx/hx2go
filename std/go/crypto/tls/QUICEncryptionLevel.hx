package go.crypto.tls;

@:go.Type({ name: "QUICEncryptionLevel", instanceName: "tls.QUICEncryptionLevel", imports: ["crypto/tls"] })
extern typedef QUICEncryptionLevel = haxe.extern.EitherType<go.GoInt, {
    @:native("String") function string(): (String);

}>