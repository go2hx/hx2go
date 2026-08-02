package go.database.sql.driver;

@:structInit
@:go.Type({ name: "stringType", instanceName: "driver.stringType", imports: ["database/sql/driver"] })
extern class StringType {

    @:native("ConvertValue") function convertValue(v: Dynamic): (go.Result<go.database.sql.driver.Value>);

}