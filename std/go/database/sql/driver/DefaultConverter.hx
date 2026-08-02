package go.database.sql.driver;

@:structInit
@:go.Type({ name: "defaultConverter", instanceName: "driver.defaultConverter", imports: ["database/sql/driver"] })
extern class DefaultConverter {

    @:native("ConvertValue") function convertValue(v: Dynamic): (go.Result<go.database.sql.driver.Value>);

}