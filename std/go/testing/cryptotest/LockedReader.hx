package go.testing.cryptotest;

@:structInit
@:go.Type({ name: "lockedReader", instanceName: "cryptotest.lockedReader", imports: ["testing/cryptotest"] })
extern class LockedReader {

    @:native("Mutex") var mutex: go.sync.Mutex;

    function new(mutex: go.sync.Mutex);

    @:native("Lock") function lock(): Void;
    @:native("Read") function read(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("TryLock") function tryLock(): (Bool);
    @:native("Unlock") function unlock(): Void;

}