package go.database.sql.driver;

/**
    NotNull is a type that implements [ValueConverter] by disallowing nil
    values but otherwise delegating to another [ValueConverter].
**/
@:structInit
@:go.Type({ name: "NotNull", instanceName: "driver.NotNull", imports: ["database/sql/driver"] })
extern class NotNull {

    @:native("Converter") var converter: go.database.sql.driver.ValueConverter;

    function new(converter: go.database.sql.driver.ValueConverter=null);

    @:native("ConvertValue") function convertValue(v: Dynamic): (go.Result<go.database.sql.driver.Value>);

}