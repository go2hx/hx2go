package go.crypto.tls;

@:structInit
@:go.Type({ name: "halfConn", instanceName: "tls.halfConn", imports: ["crypto/tls"] })
extern class HalfConn {

    @:native("Mutex") var mutex: go.sync.Mutex;

    function new(mutex: go.sync.Mutex);

    @:native("Lock") function lock(): Void;
    @:native("TryLock") function tryLock(): (Bool);
    @:native("Unlock") function unlock(): Void;

}