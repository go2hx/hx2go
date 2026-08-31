package go.database.sql.driver;

/**
    QueryerContext is an optional interface that may be implemented by a [Conn].
    
    If a [Conn] does not implement QueryerContext, the [database/sql.DB.Query]
    will fall back to [Queryer]; if the [Conn] does not implement [Queryer] either,
    [database/sql.DB.Query] will first prepare a query, execute the statement, and then
    close the statement.
    
    QueryContext may return [ErrSkip].
    
    QueryContext must honor the context timeout and return when the context is canceled.
**/
@:go.Type({ name: "QueryerContext", instanceName: "driver.QueryerContext", imports: ["database/sql/driver"] })
extern typedef QueryerContext = {

    @:native("QueryContext") function queryContext(ctx: go.context.Context, query: std.String, args: go.Slice<go.database.sql.driver.NamedValue>): (go.Result<go.database.sql.driver.Rows>);

}