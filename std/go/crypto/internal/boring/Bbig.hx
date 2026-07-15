package go.crypto.internal.boring;

@:go.Type({ name: "bbig", instanceName: "bbig.bbig", imports: ["crypto/internal/boring/bbig"] })
extern class Bbig {

    @:native("Dec") static function dec(b: go.crypto.internal.boring.BigInt): go.Pointer<go.math.big.Int>;
    @:native("Enc") static function enc(b: go.Pointer<go.math.big.Int>): go.crypto.internal.boring.BigInt;

}