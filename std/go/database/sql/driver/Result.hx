package go.database.sql.driver;

@:go.Type({ name: "Result", instanceName: "driver.Result", imports: ["database/sql/driver"] })
extern typedef Result = {

    @:native("LastInsertId") function lastInsertId(): go.Result<go.Int64>;
    @:native("RowsAffected") function rowsAffected(): go.Result<go.Int64>;

}