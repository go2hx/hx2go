package go.database.sql;

@:structInit
@:go.Type({ name: "NullString", instanceName: "sql.NullString", imports: ["database/sql"] })
extern class NullString {

    @:native("String") var string: String;
    @:native("Valid") var valid: Bool;

function new(string: String, valid: Bool);

    @:native("Scan") function scan(value: Dynamic): go.Error;
    @:native("Value") function value(): go.Result<go.database.sql.driver.Value>;

}