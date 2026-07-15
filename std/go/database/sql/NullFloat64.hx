package go.database.sql;

@:structInit
@:go.Type({ name: "NullFloat64", instanceName: "sql.NullFloat64", imports: ["database/sql"] })
extern class NullFloat64 {

    @:native("Float64") var float64: Float;
    @:native("Valid") var valid: Bool;

function new(float64: Float, valid: Bool);

    @:native("Scan") function scan(value: Dynamic): go.Error;
    @:native("Value") function value(): go.Result<go.database.sql.driver.Value>;

}