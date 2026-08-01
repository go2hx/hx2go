package go.database.sql;

@:structInit
@:go.Type({ name: "driverConn", instanceName: "sql.driverConn", imports: ["database/sql"] })
extern class DriverConn {

    @:native("Mutex") var mutex: go.sync.Mutex;

    function new(mutex: go.sync.Mutex);

    @:native("Close") function close(): (go.Error);
    @:native("Lock") function lock(): Void;
    @:native("TryLock") function tryLock(): (Bool);
    @:native("Unlock") function unlock(): Void;

}