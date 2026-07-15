package go.database.sql;

@:structInit
@:go.Type({ name: "Out", instanceName: "sql.Out", imports: ["database/sql"] })
extern class Out {

    @:native("Dest") var dest: Dynamic;
    @:native("In") var _in: Bool;

function new(dest: Dynamic, _in: Bool);

}