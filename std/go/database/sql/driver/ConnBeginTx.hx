package go.database.sql.driver;

@:go.Type({ name: "ConnBeginTx", instanceName: "driver.ConnBeginTx", imports: ["database/sql/driver"] })
extern typedef ConnBeginTx = {

    @:native("BeginTx") function beginTx(ctx: go.context.Context, opts: go.database.sql.driver.TxOptions): go.Result<go.database.sql.driver.Tx>;

}