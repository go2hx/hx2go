package go.database.sql.driver;

@:go.Type({ name: "DriverContext", instanceName: "driver.DriverContext", imports: ["database/sql/driver"] })
extern typedef DriverContext = {

    @:native("OpenConnector") function openConnector(name: String): go.Result<go.database.sql.driver.Connector>;

}