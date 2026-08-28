package go.database.sql.driver;

/**
    Conn is a connection to a database. It is not used concurrently
    by multiple goroutines.
    
    Conn is assumed to be stateful.
**/
@:go.Type({ name: "Conn", instanceName: "driver.Conn", imports: ["database/sql/driver"] })
extern typedef Conn = {

    @:native("Begin") function begin(): (go.Result<go.database.sql.driver.Tx>);
    @:native("Close") function close(): (go.Error);
    @:native("Prepare") function prepare(query: std.String): (go.Result<go.database.sql.driver.Stmt>);

}