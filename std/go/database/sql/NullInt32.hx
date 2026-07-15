package go.database.sql;

@:structInit
@:go.Type({ name: "NullInt32", instanceName: "sql.NullInt32", imports: ["database/sql"] })
extern class NullInt32 {

    @:native("Int32") var int32: go.Int32;
    @:native("Valid") var valid: Bool;

function new(int32: go.Int32, valid: Bool);

    @:native("Scan") function scan(value: Dynamic): go.Error;
    @:native("Value") function value(): go.Result<go.database.sql.driver.Value>;

}