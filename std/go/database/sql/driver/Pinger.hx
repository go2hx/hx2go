package go.database.sql.driver;

@:go.Type({ name: "Pinger", instanceName: "driver.Pinger", imports: ["database/sql/driver"] })
extern typedef Pinger = {

    @:native("Ping") function ping(ctx: go.context.Context): go.Error;

}