package go.database.sql.driver;

@:go.Type({ name: "Execer", instanceName: "driver.Execer", imports: ["database/sql/driver"] })
extern typedef Execer = {

    @:native("Exec") function exec(query: String, args: go.Slice<go.database.sql.driver.Value>): go.Result<go.database.sql.driver.Result>;

}