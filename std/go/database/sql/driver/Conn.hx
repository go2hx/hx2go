package go.database.sql.driver;

@:go.Type({ name: "Conn", instanceName: "driver.Conn", imports: ["database/sql/driver"] })
extern typedef Conn = {

    @:native("Begin") function begin(): go.Result<go.database.sql.driver.Tx>;
    @:native("Close") function close(): go.Error;
    @:native("Prepare") function prepare(query: String): go.Result<go.database.sql.driver.Stmt>;

}