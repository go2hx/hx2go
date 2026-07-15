package go.database.sql;

@:structInit
@:go.Type({ name: "NullInt64", instanceName: "sql.NullInt64", imports: ["database/sql"] })
extern class NullInt64 {

    @:native("Int64") var int64: go.Int64;
    @:native("Valid") var valid: Bool;

function new(int64: go.Int64, valid: Bool);

    @:native("Scan") function scan(value: Dynamic): go.Error;
    @:native("Value") function value(): go.Result<go.database.sql.driver.Value>;

}