package go.database.sql.driver;

@:structInit
@:go.Type({ name: "int32Type", instanceName: "driver.int32Type", imports: ["database/sql/driver"] })
extern class Int32Type {

    @:native("ConvertValue") function convertValue(v: Dynamic): (go.Result<go.database.sql.driver.Value>);

}