package go.database.sql.driver;

/**
    Driver is the interface that must be implemented by a database
    driver.
    
    Database drivers may implement [DriverContext] for access
    to contexts and to parse the name only once for a pool of connections,
    instead of once per connection.
**/
@:go.Type({ name: "Driver", instanceName: "driver.Driver", imports: ["database/sql/driver"] })
extern typedef Driver = {

    @:native("Open") function open(name: std.String): (go.Result<go.database.sql.driver.Conn>);

}