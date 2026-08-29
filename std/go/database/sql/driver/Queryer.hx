package go.database.sql.driver;

/**
    Queryer is an optional interface that may be implemented by a [Conn].
    
    If a [Conn] implements neither [QueryerContext] nor [Queryer],
    the [database/sql.DB.Query] will first prepare a query, execute the statement,
    and then close the statement.
    
    Query may return [ErrSkip].
    
    Deprecated: Drivers should implement [QueryerContext] instead.
**/
@:go.Type({ name: "Queryer", instanceName: "driver.Queryer", imports: ["database/sql/driver"] })
extern typedef Queryer = {

    @:native("Query") function query(query: std.String, args: go.Slice<go.database.sql.driver.Value>): (go.Result<go.database.sql.driver.Rows>);

}