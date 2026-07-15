package go.database.sql.driver;

@:structInit
@:go.Type({ name: "Null", instanceName: "driver.Null", imports: ["database/sql/driver"] })
extern class Null {

    @:native("Converter") var converter: go.database.sql.driver.ValueConverter;

function new(converter: go.database.sql.driver.ValueConverter);

    @:native("ConvertValue") function convertValue(v: Dynamic): go.Result<go.database.sql.driver.Value>;

}