package go.crypto.tls;

@:go.Type({ name: "alert", instanceName: "tls.alert", imports: ["crypto/tls"] })
extern typedef Alert = haxe.extern.EitherType<go.UInt8, {
    @:native("Error") function error(): (String);
    @:native("String") function string(): (String);

}>