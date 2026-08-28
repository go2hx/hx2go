package go.database.sql.driver;

/**
    ConnPrepareContext enhances the [Conn] interface with context.
**/
@:go.Type({ name: "ConnPrepareContext", instanceName: "driver.ConnPrepareContext", imports: ["database/sql/driver"] })
extern typedef ConnPrepareContext = {

    @:native("PrepareContext") function prepareContext(ctx: go.context.Context, query: std.String): (go.Result<go.database.sql.driver.Stmt>);

}