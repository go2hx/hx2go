package go.sync;

@:structInit
@:go.Type({ name: "RWMutex", instanceName: "sync.RWMutex", imports: ["sync"] })
extern class RWMutex {

    @:native("Lock") function lock(): Void;
    @:native("RLock") function rLock(): Void;
    @:native("RLocker") function rLocker(): go.sync.Locker;
    @:native("RUnlock") function rUnlock(): Void;
    @:native("TryLock") function tryLock(): Bool;
    @:native("TryRLock") function tryRLock(): Bool;
    @:native("Unlock") function unlock(): Void;

}