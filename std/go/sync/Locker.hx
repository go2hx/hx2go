package go.sync;

@:go.Type({ name: "Locker", instanceName: "sync.Locker", imports: ["sync"] })
extern typedef Locker = {

    @:native("Lock") function lock(): Void;
    @:native("Unlock") function unlock(): Void;

}