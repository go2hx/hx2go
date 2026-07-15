package go.database.sql.driver;

@:structInit
@:go.Type({ name: "TxOptions", instanceName: "driver.TxOptions", imports: ["database/sql/driver"] })
extern class TxOptions {

    @:native("Isolation") var isolation: go.database.sql.driver.IsolationLevel;
    @:native("ReadOnly") var readOnly: Bool;

function new(isolation: go.database.sql.driver.IsolationLevel, readOnly: Bool);

}