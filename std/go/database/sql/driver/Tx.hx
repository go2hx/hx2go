package go.database.sql.driver;

/**
    Tx is a transaction.
**/
@:go.Type({ name: "Tx", instanceName: "driver.Tx", imports: ["database/sql/driver"] })
extern typedef Tx = {

    @:native("Commit") function commit(): (go.Error);
    @:native("Rollback") function rollback(): (go.Error);

}