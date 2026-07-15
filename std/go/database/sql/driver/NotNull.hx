package go.database.sql.driver;

@:structInit
@:go.Type({ name: "NotNull", instanceName: "driver.NotNull", imports: ["database/sql/driver"] })
extern class NotNull {

    @:native("Converter") var converter: go.database.sql.driver.ValueConverter;

function new(converter: go.database.sql.driver.ValueConverter);

    @:native("ConvertValue") function convertValue(v: Dynamic): go.Result<go.database.sql.driver.Value>;

}