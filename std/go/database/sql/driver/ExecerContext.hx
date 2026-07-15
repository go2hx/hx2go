package go.database.sql.driver;

@:go.Type({ name: "ExecerContext", instanceName: "driver.ExecerContext", imports: ["database/sql/driver"] })
extern typedef ExecerContext = {

    @:native("ExecContext") function execContext(ctx: go.context.Context, query: String, args: go.Slice<go.database.sql.driver.NamedValue>): go.Result<go.database.sql.driver.Result>;

}