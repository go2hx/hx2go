package go.crypto.internal;

@:go.Type({ name: "fips140hash", instanceName: "fips140hash.fips140hash", imports: ["crypto/internal/fips140hash"] })
extern class Fips140hash {

    @:native("Unwrap") static function unwrap(h: go.hash.Hash): go.hash.Hash;
    @:native("UnwrapNew") static function unwrapNew<Hash: go.hash.Hash>(newHash: () -> Hash): () -> go.hash.Hash;

}