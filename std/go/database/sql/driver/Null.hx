package go.database.sql.driver;

/**
    Null is a type that implements [ValueConverter] by allowing nil
    values but otherwise delegating to another [ValueConverter].
**/
@:structInit
@:go.Type({ name: "Null", instanceName: "driver.Null", imports: ["database/sql/driver"] })
extern class Null {

    @:native("Converter") var converter: go.database.sql.driver.ValueConverter;

    function new(converter: go.database.sql.driver.ValueConverter=null);

    @:native("ConvertValue") function convertValue(v: Dynamic): (go.Result<go.database.sql.driver.Value>);

}