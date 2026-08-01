package go.database.sql.driver;

@:go.Type({ name: "RowsAffected", instanceName: "driver.RowsAffected", imports: ["database/sql/driver"] })
extern typedef RowsAffected = haxe.extern.EitherType<go.Int64, {
    @:native("LastInsertId") function lastInsertId(): (go.Result<go.Int64>);
    @:native("RowsAffected") function rowsAffected(): (go.Result<go.Int64>);

}>