package go.database.sql.driver;

/**
    A Connector represents a driver in a fixed configuration
    and can create any number of equivalent Conns for use
    by multiple goroutines.
    
    A Connector can be passed to [database/sql.OpenDB], to allow drivers
    to implement their own [database/sql.DB] constructors, or returned by
    [DriverContext]'s OpenConnector method, to allow drivers
    access to context and to avoid repeated parsing of driver
    configuration.
    
    If a Connector implements [io.Closer], the [database/sql.DB.Close]
    method will call the Close method and return error (if any).
**/
@:go.Type({ name: "Connector", instanceName: "driver.Connector", imports: ["database/sql/driver"] })
extern typedef Connector = {

    @:native("Connect") function connect(p0: go.context.Context): (go.Result<go.database.sql.driver.Conn>);
    @:native("Driver") function driver(): (go.database.sql.driver.Driver);

}