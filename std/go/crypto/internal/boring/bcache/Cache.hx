package go.crypto.internal.boring.bcache;

@:structInit
@:go.Type({ name: "Cache", instanceName: "bcache.Cache", imports: ["crypto/internal/boring/bcache"] })
extern class Cache<K: Dynamic, V: Dynamic> {

    @:native("Clear") function clear(): Void;
    @:native("Get") function get(k: go.Pointer<K>): go.Pointer<V>;
    @:native("Put") function put(k: go.Pointer<K>, v: go.Pointer<V>): Void;
    @:native("Register") function register(): Void;

}