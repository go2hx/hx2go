package go.database.sql.driver;

/**
    NamedValue holds both the value name and value.
**/
@:structInit
@:go.Type({ name: "NamedValue", instanceName: "driver.NamedValue", imports: ["database/sql/driver"] })
extern class NamedValue {

    @:native("Name") var name: std.String;
    @:native("Ordinal") var ordinal: go.GoInt;
    @:native("Value") var value: go.database.sql.driver.Value;

    function new(name: std.String="", ordinal: go.GoInt=0, value: go.database.sql.driver.Value=null);

}