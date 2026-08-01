package go.crypto.des;

@:go.Type({ name: "KeySizeError", instanceName: "des.KeySizeError", imports: ["crypto/des"] })
extern typedef KeySizeError = haxe.extern.EitherType<go.GoInt, {
    @:native("Error") function error(): (String);

}>