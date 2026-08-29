package go.database.sql.driver;

/**
    Execer is an optional interface that may be implemented by a [Conn].
    
    If a [Conn] implements neither [ExecerContext] nor [Execer],
    the [database/sql.DB.Exec] will first prepare a query, execute the statement,
    and then close the statement.
    
    Exec may return [ErrSkip].
    
    Deprecated: Drivers should implement [ExecerContext] instead.
**/
@:go.Type({ name: "Execer", instanceName: "driver.Execer", imports: ["database/sql/driver"] })
extern typedef Execer = {

    @:native("Exec") function exec(query: std.String, args: go.Slice<go.database.sql.driver.Value>): (go.Result<go.database.sql.driver.Result>);

}