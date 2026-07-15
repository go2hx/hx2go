package go.database.sql;

@:structInit
@:go.Type({ name: "NamedArg", instanceName: "sql.NamedArg", imports: ["database/sql"] })
extern class NamedArg {

    @:native("Name") var name: String;
    @:native("Value") var value: Dynamic;

function new(name: String, value: Dynamic);

}