package go.database.sql.driver;

/**
    SessionResetter may be implemented by [Conn] to allow drivers to reset the
    session state associated with the connection and to signal a bad connection.
**/
@:go.Type({ name: "SessionResetter", instanceName: "driver.SessionResetter", imports: ["database/sql/driver"] })
extern typedef SessionResetter = {

    @:native("ResetSession") function resetSession(ctx: go.context.Context): (go.Error);

}