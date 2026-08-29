package go.database.sql;

@:structInit
@:go.Type({ name: "driverStmt", instanceName: "sql.driverStmt", imports: ["database/sql"] })
extern class DriverStmt {

    @:native("Locker") var locker: go.sync.Locker;

    function new(locker: go.sync.Locker=null);

    @:native("Close") function close(): (go.Error);
    @:native("Lock") function lock(): Void;
    @:native("Unlock") function unlock(): Void;

}