package go.crypto.aes;

@:go.Type({ name: "KeySizeError", instanceName: "aes.KeySizeError", imports: ["crypto/aes"] })
extern typedef KeySizeError = haxe.extern.EitherType<go.GoInt, {
    @:native("Error") function error(): (String);

}>