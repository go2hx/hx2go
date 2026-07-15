package go.internal.sync;

@:structInit
@:go.Type({ name: "Mutex", instanceName: "sync.Mutex", imports: ["internal/sync"] })
extern class Mutex {

    @:native("Lock") function lock(): Void;
    @:native("TryLock") function tryLock(): Bool;
    @:native("Unlock") function unlock(): Void;

}