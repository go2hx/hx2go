package go.database.sql;

@:structInit
@:go.Type({ name: "Row", instanceName: "sql.Row", imports: ["database/sql"] })
extern class Row {

    @:native("Err") function err(): go.Error;
    @:native("Scan") function scan(dest: haxe.Rest<Dynamic>): go.Error;

}