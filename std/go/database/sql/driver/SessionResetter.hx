package go.database.sql.driver;

@:go.Type({ name: "SessionResetter", instanceName: "driver.SessionResetter", imports: ["database/sql/driver"] })
extern typedef SessionResetter = {

    @:native("ResetSession") function resetSession(ctx: go.context.Context): go.Error;

}