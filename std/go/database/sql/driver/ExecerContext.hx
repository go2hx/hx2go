package go.database.sql.driver;

/**
    ExecerContext is an optional interface that may be implemented by a [Conn].
    
    If a [Conn] does not implement [ExecerContext], the [database/sql.DB.Exec]
    will fall back to [Execer]; if the Conn does not implement Execer either,
    [database/sql.DB.Exec] will first prepare a query, execute the statement, and then
    close the statement.
    
    ExecContext may return [ErrSkip].
    
    ExecContext must honor the context timeout and return when the context is canceled.
**/
@:go.Type({ name: "ExecerContext", instanceName: "driver.ExecerContext", imports: ["database/sql/driver"] })
extern typedef ExecerContext = {

    @:native("ExecContext") function execContext(ctx: go.context.Context, query: std.String, args: go.Slice<go.database.sql.driver.NamedValue>): (go.Result<go.database.sql.driver.Result>);

}