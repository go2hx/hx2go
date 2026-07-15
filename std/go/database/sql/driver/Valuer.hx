package go.database.sql.driver;

@:go.Type({ name: "Valuer", instanceName: "driver.Valuer", imports: ["database/sql/driver"] })
extern typedef Valuer = {

    @:native("Value") function value(): go.Result<go.database.sql.driver.Value>;

}