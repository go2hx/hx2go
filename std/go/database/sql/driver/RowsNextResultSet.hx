package go.database.sql.driver;

@:go.Type({ name: "RowsNextResultSet", instanceName: "driver.RowsNextResultSet", imports: ["database/sql/driver"] })
extern typedef RowsNextResultSet = {

    @:native("Close") function close(): go.Error;
    @:native("Columns") function columns(): go.Slice<String>;
    @:native("HasNextResultSet") function hasNextResultSet(): Bool;
    @:native("Next") function next(dest: go.Slice<go.database.sql.driver.Value>): go.Error;
    @:native("NextResultSet") function nextResultSet(): go.Error;

}