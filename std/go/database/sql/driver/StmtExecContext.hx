package go.database.sql.driver;

/**
    StmtExecContext enhances the [Stmt] interface by providing Exec with context.
**/
@:go.Type({ name: "StmtExecContext", instanceName: "driver.StmtExecContext", imports: ["database/sql/driver"] })
extern typedef StmtExecContext = {

    @:native("ExecContext") function execContext(ctx: go.context.Context, args: go.Slice<go.database.sql.driver.NamedValue>): (go.Result<go.database.sql.driver.Result>);

}