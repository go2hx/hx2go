package go.database.sql;

@:go.Type({ name: "IsolationLevel", instanceName: "sql.IsolationLevel", imports: ["database/sql"] })
extern typedef IsolationLevel = haxe.extern.EitherType<go.GoInt, {
    @:native("String") function string(): (String);

}>