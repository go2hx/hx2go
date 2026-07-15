package go.database.sql.driver;

@:go.Type({ name: "StmtQueryContext", instanceName: "driver.StmtQueryContext", imports: ["database/sql/driver"] })
extern typedef StmtQueryContext = {

    @:native("QueryContext") function queryContext(ctx: go.context.Context, args: go.Slice<go.database.sql.driver.NamedValue>): go.Result<go.database.sql.driver.Rows>;

}