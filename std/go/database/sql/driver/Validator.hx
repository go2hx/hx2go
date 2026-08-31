package go.database.sql.driver;

/**
    Validator may be implemented by [Conn] to allow drivers to
    signal if a connection is valid or if it should be discarded.
    
    If implemented, drivers may return the underlying error from queries,
    even if the connection should be discarded by the connection pool.
**/
@:go.Type({ name: "Validator", instanceName: "driver.Validator", imports: ["database/sql/driver"] })
extern typedef Validator = {

    @:native("IsValid") function isValid(): (Bool);

}