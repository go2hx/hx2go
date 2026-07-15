package go.crypto.internal;

@:go.Type({ name: "randutil", instanceName: "randutil.randutil", imports: ["crypto/internal/randutil"] })
extern class Randutil {

    @:native("MaybeReadByte") static function maybeReadByte(r: go.io.Reader): Void;

}