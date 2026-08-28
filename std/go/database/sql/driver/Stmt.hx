package go.database.sql.driver;

/**
    Stmt is a prepared statement. It is bound to a [Conn] and not
    used by multiple goroutines concurrently.
**/
@:go.Type({ name: "Stmt", instanceName: "driver.Stmt", imports: ["database/sql/driver"] })
extern typedef Stmt = {

    @:native("Close") function close(): (go.Error);
    @:native("Exec") function exec(args: go.Slice<go.database.sql.driver.Value>): (go.Result<go.database.sql.driver.Result>);
    @:native("NumInput") function numInput(): (go.GoInt);
    @:native("Query") function query(args: go.Slice<go.database.sql.driver.Value>): (go.Result<go.database.sql.driver.Rows>);

}