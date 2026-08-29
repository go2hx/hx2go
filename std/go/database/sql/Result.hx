package go.database.sql;

/**
    A Result summarizes an executed SQL command.
**/
@:go.Type({ name: "Result", instanceName: "sql.Result", imports: ["database/sql"] })
extern typedef Result = {

    @:native("LastInsertId") function lastInsertId(): (go.Result<go.Int64>);
    @:native("RowsAffected") function rowsAffected(): (go.Result<go.Int64>);

}