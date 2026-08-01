package go.database.sql;

@:structInit
@:go.Type({ name: "connRequestSet", instanceName: "sql.connRequestSet", imports: ["database/sql"] })
extern class ConnRequestSet {

    @:native("Add") function add(v: go.Chan<go.database.sql.ConnRequest>): (go.database.sql.ConnRequestDelHandle);
    @:native("CloseAndRemoveAll") function closeAndRemoveAll(): Void;
    @:native("Delete") function delete(h: go.database.sql.ConnRequestDelHandle): (Bool);
    @:native("Len") function len(): (go.GoInt);
    @:go.Tuple("v", "ok") @:native("TakeRandom") function takeRandom(): (go.Tuple<{ v: go.Chan<go.database.sql.ConnRequest>, ok: Bool }>);

}