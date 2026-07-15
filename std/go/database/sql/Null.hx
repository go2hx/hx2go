package go.database.sql;

@:structInit
@:go.Type({ name: "Null", instanceName: "sql.Null", imports: ["database/sql"] })
extern class Null<T: Dynamic> {

    @:native("V") var V: T;
    @:native("Valid") var valid: Bool;

function new(V: T, valid: Bool);

    @:native("Scan") function scan(value: Dynamic): go.Error;
    @:native("Value") function value(): go.Result<go.database.sql.driver.Value>;

}