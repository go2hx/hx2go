package go.database.sql.driver;

/**
    If a [Driver] implements DriverContext, then [database/sql.DB] will call
    OpenConnector to obtain a [Connector] and then invoke
    that [Connector]'s Connect method to obtain each needed connection,
    instead of invoking the [Driver]'s Open method for each connection.
    The two-step sequence allows drivers to parse the name just once
    and also provides access to per-[Conn] contexts.
**/
@:go.Type({ name: "DriverContext", instanceName: "driver.DriverContext", imports: ["database/sql/driver"] })
extern typedef DriverContext = {

    @:native("OpenConnector") function openConnector(name: std.String): (go.Result<go.database.sql.driver.Connector>);

}