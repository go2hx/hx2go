package go.database.sql.driver;

/**
    RowsNextResultSet extends the [Rows] interface by providing a way to signal
    the driver to advance to the next result set.
**/
@:go.Type({ name: "RowsNextResultSet", instanceName: "driver.RowsNextResultSet", imports: ["database/sql/driver"] })
extern typedef RowsNextResultSet = {

    @:native("Close") function close(): (go.Error);
    @:native("Columns") function columns(): (go.Slice<std.String>);
    @:native("HasNextResultSet") function hasNextResultSet(): (Bool);
    @:native("Next") function next(dest: go.Slice<go.database.sql.driver.Value>): (go.Error);
    @:native("NextResultSet") function nextResultSet(): (go.Error);

}