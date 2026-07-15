package go.database.sql.driver;

@:go.Type({ name: "Validator", instanceName: "driver.Validator", imports: ["database/sql/driver"] })
extern typedef Validator = {

    @:native("IsValid") function isValid(): Bool;

}