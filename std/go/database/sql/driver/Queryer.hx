package go.database.sql.driver;

@:go.Type({ name: "Queryer", instanceName: "driver.Queryer", imports: ["database/sql/driver"] })
extern typedef Queryer = {

    @:native("Query") function query(query: String, args: go.Slice<go.database.sql.driver.Value>): go.Result<go.database.sql.driver.Rows>;

}