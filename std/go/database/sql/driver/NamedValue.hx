package go.database.sql.driver;

@:structInit
@:go.Type({ name: "NamedValue", instanceName: "driver.NamedValue", imports: ["database/sql/driver"] })
extern class NamedValue {

    @:native("Name") var name: String;
    @:native("Ordinal") var ordinal: go.GoInt;
    @:native("Value") var value: go.database.sql.driver.Value;

function new(name: String, ordinal: go.GoInt, value: go.database.sql.driver.Value);

}