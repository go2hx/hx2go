package go.database.sql;

@:structInit
@:go.Type({ name: "Rows", instanceName: "sql.Rows", imports: ["database/sql"] })
extern class Rows {

    @:native("Close") function close(): go.Error;
    @:native("ColumnTypes") function columnTypes(): go.Result<go.Slice<go.Pointer<go.database.sql.ColumnType>>>;
    @:native("Columns") function columns(): go.Result<go.Slice<String>>;
    @:native("Err") function err(): go.Error;
    @:native("Next") function next(): Bool;
    @:native("NextResultSet") function nextResultSet(): Bool;
    @:native("Scan") function scan(dest: haxe.Rest<Dynamic>): go.Error;

}