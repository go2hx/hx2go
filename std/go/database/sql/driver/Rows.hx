package go.database.sql.driver;

@:go.Type({ name: "Rows", instanceName: "driver.Rows", imports: ["database/sql/driver"] })
extern typedef Rows = {

    @:native("Close") function close(): go.Error;
    @:native("Columns") function columns(): go.Slice<String>;
    @:native("Next") function next(dest: go.Slice<go.database.sql.driver.Value>): go.Error;

}