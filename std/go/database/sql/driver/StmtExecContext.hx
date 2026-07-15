package go.database.sql.driver;

@:go.Type({ name: "StmtExecContext", instanceName: "driver.StmtExecContext", imports: ["database/sql/driver"] })
extern typedef StmtExecContext = {

    @:native("ExecContext") function execContext(ctx: go.context.Context, args: go.Slice<go.database.sql.driver.NamedValue>): go.Result<go.database.sql.driver.Result>;

}