package go.crypto.tls;

@:go.Type({ name: "CurveID", instanceName: "tls.CurveID", imports: ["crypto/tls"] })
extern typedef CurveID = haxe.extern.EitherType<go.UInt16, {
    @:native("String") function string(): (String);

}>