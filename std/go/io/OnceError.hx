package go.io;

@:structInit
@:go.Type({ name: "onceError", instanceName: "io.onceError", imports: ["io"] })
extern class OnceError {

    @:native("Mutex") var mutex: go.sync.Mutex;

    function new(mutex: go.sync.Mutex);

    @:native("Load") function load(): (go.Error);
    @:native("Lock") function lock(): Void;
    @:native("Store") function store(err: go.Error): Void;
    @:native("TryLock") function tryLock(): (Bool);
    @:native("Unlock") function unlock(): Void;

}