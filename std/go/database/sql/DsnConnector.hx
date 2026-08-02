package go.database.sql;

@:structInit
@:go.Type({ name: "dsnConnector", instanceName: "sql.dsnConnector", imports: ["database/sql"] })
extern class DsnConnector {

    @:native("Connect") function connect(_: go.context.Context): (go.Result<go.database.sql.driver.Conn>);
    @:native("Driver") function driver(): (go.database.sql.driver.Driver);

}