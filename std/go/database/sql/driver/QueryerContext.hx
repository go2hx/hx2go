package go.database.sql.driver;

@:go.Type({ name: "QueryerContext", instanceName: "driver.QueryerContext", imports: ["database/sql/driver"] })
extern typedef QueryerContext = {

    @:native("QueryContext") function queryContext(ctx: go.context.Context, query: String, args: go.Slice<go.database.sql.driver.NamedValue>): go.Result<go.database.sql.driver.Rows>;

}