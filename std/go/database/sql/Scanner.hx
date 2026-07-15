package go.database.sql;

@:go.Type({ name: "Scanner", instanceName: "sql.Scanner", imports: ["database/sql"] })
extern typedef Scanner = {

    @:native("Scan") function scan(src: Dynamic): go.Error;

}