package go.database.sql;

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

function new(maxOpenConnections: go.GoInt, openConnections: go.GoInt, inUse: go.GoInt, idle: go.GoInt, waitCount: go.Int64, waitDuration: go.time.Duration, maxIdleClosed: go.Int64, maxIdleTimeClosed: go.Int64, maxLifetimeClosed: go.Int64);

}