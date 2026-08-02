package go.crypto.rc4;

@:go.Type({ name: "KeySizeError", instanceName: "rc4.KeySizeError", imports: ["crypto/rc4"] })
extern typedef KeySizeError = haxe.extern.EitherType<go.GoInt, {
    @:native("Error") function error(): (String);

}>