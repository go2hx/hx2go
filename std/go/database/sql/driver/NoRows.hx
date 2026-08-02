package go.database.sql.driver;

@:structInit
@:go.Type({ name: "noRows", instanceName: "driver.noRows", imports: ["database/sql/driver"] })
extern class NoRows {

    @:native("LastInsertId") function lastInsertId(): (go.Result<go.Int64>);
    @:native("RowsAffected") function rowsAffected(): (go.Result<go.Int64>);

}