package go.database.sql.driver;

/**
    Rows is an iterator over an executed query's results.
**/
@:go.Type({ name: "Rows", instanceName: "driver.Rows", imports: ["database/sql/driver"] })
extern typedef Rows = {

    @:native("Close") function close(): (go.Error);
    @:native("Columns") function columns(): (go.Slice<std.String>);
    @:native("Next") function next(dest: go.Slice<go.database.sql.driver.Value>): (go.Error);

}