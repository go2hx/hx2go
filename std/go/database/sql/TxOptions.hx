package go.database.sql;

@:structInit
@:go.Type({ name: "TxOptions", instanceName: "sql.TxOptions", imports: ["database/sql"] })
extern class TxOptions {

    @:native("Isolation") var isolation: go.database.sql.IsolationLevel;
    @:native("ReadOnly") var readOnly: Bool;

function new(isolation: go.database.sql.IsolationLevel, readOnly: Bool);

}