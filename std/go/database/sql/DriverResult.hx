package go.database.sql;

@:structInit
@:go.Type({ name: "driverResult", instanceName: "sql.driverResult", imports: ["database/sql"] })
extern class DriverResult {

    @:native("Locker") var locker: go.sync.Locker;

    function new(locker: go.sync.Locker);

    @:native("LastInsertId") function lastInsertId(): (go.Result<go.Int64>);
    @:native("Lock") function lock(): Void;
    @:native("RowsAffected") function rowsAffected(): (go.Result<go.Int64>);
    @:native("Unlock") function unlock(): Void;

}