package go.database.sql;

/**
    Row is the result of calling [DB.QueryRow] to select a single row.
**/
@:structInit
@:go.Type({ name: "Row", instanceName: "sql.Row", imports: ["database/sql"] })
extern class Row {

    /**
        Err provides a way for wrapping packages to check for
        query errors without calling [Row.Scan].
        Err returns the error, if any, that was encountered while running the query.
        If this error is not nil, this error will also be returned from [Row.Scan].
    **/
    @:native("Err") function err(): (go.Error);
    /**
        Scan copies the columns from the matched row into the values
        pointed at by dest. See the documentation on [Rows.Scan] for details.
        If more than one row matches the query,
        Scan uses the first row and discards the rest. If no row matches
        the query, Scan returns [ErrNoRows].
    **/
    @:native("Scan") function scan(dest: haxe.Rest<Dynamic>): (go.Error);

}