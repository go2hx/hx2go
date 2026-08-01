package go.crypto.tls;

@:go.Type({ name: "AlertError", instanceName: "tls.AlertError", imports: ["crypto/tls"] })
extern typedef AlertError = haxe.extern.EitherType<go.UInt8, {
    @:native("Error") function error(): (String);

}>