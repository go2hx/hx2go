package go.crypto.internal.fips140cache;

@:structInit
@:go.Type({ name: "Cache", instanceName: "fips140cache.Cache", imports: ["crypto/internal/fips140cache"] })
extern class Cache<K: Dynamic, V: Dynamic> {

    @:native("Get") function get(k: go.Pointer<K>, _new: () -> go.Result<go.Pointer<V>>, check: (p0: go.Pointer<V>) -> Bool): go.Result<go.Pointer<V>>;

}