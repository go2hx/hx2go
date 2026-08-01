package go.net;

@:structInit
@:go.Type({ name: "ipv6ZoneCache", instanceName: "net.ipv6ZoneCache", imports: ["net"] })
extern class Ipv6ZoneCache {

    @:native("RWMutex") var rWMutex: go.sync.RWMutex;

    function new(rWMutex: go.sync.RWMutex);

    @:native("Lock") function lock(): Void;
    @:native("RLock") function rLock(): Void;
    @:native("RLocker") function rLocker(): (go.sync.Locker);
    @:native("RUnlock") function rUnlock(): Void;
    @:native("TryLock") function tryLock(): (Bool);
    @:native("TryRLock") function tryRLock(): (Bool);
    @:native("Unlock") function unlock(): Void;

}