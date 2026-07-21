package go.sync;

@:structInit
@:go.Type({ name: "Mutex", instanceName: "sync.Mutex", imports: ["sync"] })
extern class Mutex {

    @:native("Lock") function lock(): Void;
    @:native("TryLock") function tryLock(): (Bool);
    @:native("Unlock") function unlock(): Void;

}