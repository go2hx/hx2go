package go.database.sql.driver;

@:go.Type({ name: "ValueConverter", instanceName: "driver.ValueConverter", imports: ["database/sql/driver"] })
extern typedef ValueConverter = {

    @:native("ConvertValue") function convertValue(v: Dynamic): go.Result<go.database.sql.driver.Value>;

}