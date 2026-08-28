package go.database.sql.driver;

/**
    Pinger is an optional interface that may be implemented by a [Conn].
    
    If a [Conn] does not implement Pinger, the [database/sql.DB.Ping] and
    [database/sql.DB.PingContext] will check if there is at least one [Conn] available.
    
    If Conn.Ping returns [ErrBadConn], [database/sql.DB.Ping] and [database/sql.DB.PingContext] will remove
    the [Conn] from pool.
**/
@:go.Type({ name: "Pinger", instanceName: "driver.Pinger", imports: ["database/sql/driver"] })
extern typedef Pinger = {

    @:native("Ping") function ping(ctx: go.context.Context): (go.Error);

}