package go.database.sql.driver;

@:go.Type({ name: "Connector", instanceName: "driver.Connector", imports: ["database/sql/driver"] })
extern typedef Connector = {

    @:native("Connect") function connect(p0: go.context.Context): go.Result<go.database.sql.driver.Conn>;
    @:native("Driver") function driver(): go.database.sql.driver.Driver;

}