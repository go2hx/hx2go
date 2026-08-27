package go.database.sql;

@:structInit
@:go.Type({ name: "NullBool", instanceName: "sql.NullBool", imports: ["database/sql"] })
extern class NullBool {

    @:native("Bool") var bool: Bool;
    @:native("Valid") var valid: Bool;

    function new(bool: Bool=false, valid: Bool=false);

    @:native("Scan") function scan(value: Dynamic): (go.Error);
    @:native("Value") function value(): (go.Result<go.database.sql.driver.Value>);

}