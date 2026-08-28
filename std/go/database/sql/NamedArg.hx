package go.database.sql;

/**
    A NamedArg is a named argument. NamedArg values may be used as
    arguments to [DB.Query] or [DB.Exec] and bind to the corresponding named
    parameter in the SQL statement.
    
    For a more concise way to create NamedArg values, see
    the [Named] function.
**/
@:structInit
@:go.Type({ name: "NamedArg", instanceName: "sql.NamedArg", imports: ["database/sql"] })
extern class NamedArg {

    @:native("Name") var name: String;
    @:native("Value") var value: Dynamic;

    function new(name: String="", value: Dynamic=null);

}