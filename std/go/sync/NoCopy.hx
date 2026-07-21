package go.sync;

@:structInit
@:go.Type({ name: "noCopy", instanceName: "sync.noCopy", imports: ["sync"] })
extern class NoCopy {

    @:native("Lock") function lock(): Void;
    @:native("Unlock") function unlock(): Void;

}