package go.database.sql;

/**
    DBStats contains database statistics.
**/
@:structInit
@:go.Type({ name: "DBStats", instanceName: "sql.DBStats", imports: ["database/sql"] })
extern class DBStats {

    @:native("MaxOpenConnections") var maxOpenConnections: go.GoInt;
    @:native("OpenConnections") var openConnections: go.GoInt;
    @:native("InUse") var inUse: go.GoInt;
    @:native("Idle") var idle: go.GoInt;
    @:native("WaitCount") var waitCount: go.Int64;
    @:native("WaitDuration") var waitDuration: go.time.Duration;
    @:native("MaxIdleClosed") var maxIdleClosed: go.Int64;
    @:native("MaxIdleTimeClosed") var maxIdleTimeClosed: go.Int64;
    @:native("MaxLifetimeClosed") var maxLifetimeClosed: go.Int64;

    function new(maxOpenConnections: go.GoInt=0, openConnections: go.GoInt=0, inUse: go.GoInt=0, idle: go.GoInt=0, waitCount: go.Int64=0, waitDuration: go.time.Duration=cast 0, maxIdleClosed: go.Int64=0, maxIdleTimeClosed: go.Int64=0, maxLifetimeClosed: go.Int64=0);

}