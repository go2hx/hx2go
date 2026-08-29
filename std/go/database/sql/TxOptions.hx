package go.database.sql;

/**
    TxOptions holds the transaction options to be used in [DB.BeginTx].
**/
@:structInit
@:go.Type({ name: "TxOptions", instanceName: "sql.TxOptions", imports: ["database/sql"] })
extern class TxOptions {

    @:native("Isolation") var isolation: go.database.sql.IsolationLevel;
    @:native("ReadOnly") var readOnly: Bool;

    function new(isolation: go.database.sql.IsolationLevel=cast 0, readOnly: Bool=false);

}