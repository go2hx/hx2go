package go.database.sql.driver;

@:go.Type({ name: "ConnPrepareContext", instanceName: "driver.ConnPrepareContext", imports: ["database/sql/driver"] })
extern typedef ConnPrepareContext = {

    @:native("PrepareContext") function prepareContext(ctx: go.context.Context, query: String): go.Result<go.database.sql.driver.Stmt>;

}