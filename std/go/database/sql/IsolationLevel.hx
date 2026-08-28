package go.database.sql;

/**
    IsolationLevel is the transaction isolation level used in [TxOptions].
**/
@:go.Type({ name: "IsolationLevel", instanceName: "sql.IsolationLevel", imports: ["database/sql"] })
extern typedef IsolationLevel = haxe.extern.EitherType<go.GoInt, {
    /**
        String returns the name of the transaction isolation level.
    **/
    @:native("String") function string(): (String);

}>