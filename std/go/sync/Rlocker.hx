package go.sync;

@:structInit
@:go.Type({ name: "rlocker", instanceName: "sync.rlocker", imports: ["sync"] })
extern class Rlocker {

    @:native("Lock") function lock(): Void;
    @:native("Unlock") function unlock(): Void;

}