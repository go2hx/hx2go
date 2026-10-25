package go.database.sql;

@:structInit
@:go.Type({ name: "closingMutex", instanceName: "sql.closingMutex", imports: ["database/sql"] })
extern class ClosingMutex {

    @:native("Lock") function lock(): Void;
    @:native("RLock") function rLock(): Void;
    @:native("RUnlock") function rUnlock(): Void;
    @:native("TryRLock") function tryRLock(): (Bool);
    @:native("Unlock") function unlock(): Void;

}