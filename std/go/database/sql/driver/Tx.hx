package go.database.sql.driver;

@:go.Type({ name: "Tx", instanceName: "driver.Tx", imports: ["database/sql/driver"] })
extern typedef Tx = {

    @:native("Commit") function commit(): go.Error;
    @:native("Rollback") function rollback(): go.Error;

}