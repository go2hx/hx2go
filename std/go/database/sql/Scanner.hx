package go.database.sql;

/**
    Scanner is an interface used by [Rows.Scan].
**/
@:go.Type({ name: "Scanner", instanceName: "sql.Scanner", imports: ["database/sql"] })
extern typedef Scanner = {

    @:native("Scan") function scan(src: Dynamic): (go.Error);

}