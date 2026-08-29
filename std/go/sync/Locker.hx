package go.sync;

/**
    A Locker represents an object that can be locked and unlocked.
**/
@:go.Type({ name: "Locker", instanceName: "sync.Locker", imports: ["sync"] })
extern typedef Locker = {

    @:native("Lock") function lock(): Void;
    @:native("Unlock") function unlock(): Void;

}