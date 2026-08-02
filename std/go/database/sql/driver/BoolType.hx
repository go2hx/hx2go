package go.database.sql.driver;

@:structInit
@:go.Type({ name: "boolType", instanceName: "driver.boolType", imports: ["database/sql/driver"] })
extern class BoolType {

    @:native("ConvertValue") function convertValue(src: Dynamic): (go.Result<go.database.sql.driver.Value>);
    @:native("String") function string(): (String);

}