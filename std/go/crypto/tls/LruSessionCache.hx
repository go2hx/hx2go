package go.crypto.tls;

@:structInit
@:go.Type({ name: "lruSessionCache", instanceName: "tls.lruSessionCache", imports: ["crypto/tls"] })
extern class LruSessionCache {

    @:native("Mutex") var mutex: go.sync.Mutex;

    function new(mutex: go.sync.Mutex);

    @:go.Tuple("p0", "p1") @:native("Get") function get(sessionKey: String): (go.Tuple<{ p0: go.Pointer<go.crypto.tls.ClientSessionState>, p1: Bool }>);
    @:native("Lock") function lock(): Void;
    @:native("Put") function put(sessionKey: String, cs: go.Pointer<go.crypto.tls.ClientSessionState>): Void;
    @:native("TryLock") function tryLock(): (Bool);
    @:native("Unlock") function unlock(): Void;

}