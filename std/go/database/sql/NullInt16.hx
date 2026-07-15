package go.database.sql;

@:structInit
@:go.Type({ name: "NullInt16", instanceName: "sql.NullInt16", imports: ["database/sql"] })
extern class NullInt16 {

    @:native("Int16") var int16: go.Int16;
    @:native("Valid") var valid: Bool;

function new(int16: go.Int16, valid: Bool);

    @:native("Scan") function scan(value: Dynamic): go.Error;
    @:native("Value") function value(): go.Result<go.database.sql.driver.Value>;

}