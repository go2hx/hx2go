package go.database.sql.driver;

@:go.Type({ name: "Driver", instanceName: "driver.Driver", imports: ["database/sql/driver"] })
extern typedef Driver = {

    @:native("Open") function open(name: String): go.Result<go.database.sql.driver.Conn>;

}