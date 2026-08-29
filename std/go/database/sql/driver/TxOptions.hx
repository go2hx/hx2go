package go.database.sql.driver;

/**
    TxOptions holds the transaction options.
    
    This type should be considered identical to [database/sql.TxOptions].
**/
@:structInit
@:go.Type({ name: "TxOptions", instanceName: "driver.TxOptions", imports: ["database/sql/driver"] })
extern class TxOptions {

    @:native("Isolation") var isolation: go.database.sql.driver.IsolationLevel;
    @:native("ReadOnly") var readOnly: Bool;

    function new(isolation: go.database.sql.driver.IsolationLevel=cast 0, readOnly: Bool=false);

}