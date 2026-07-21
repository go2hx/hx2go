package go.sync.atomic;

@:structInit
@:go.Type({ name: "noCopy", instanceName: "atomic.noCopy", imports: ["sync/atomic"] })
extern class NoCopy {

    @:native("Lock") function lock(): Void;
    @:native("Unlock") function unlock(): Void;

}