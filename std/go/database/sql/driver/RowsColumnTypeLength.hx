package go.database.sql.driver;

@:go.Type({ name: "RowsColumnTypeLength", instanceName: "driver.RowsColumnTypeLength", imports: ["database/sql/driver"] })
extern typedef RowsColumnTypeLength = {

    @:native("Close") function close(): go.Error;
    @:go.Tuple("length", "ok") @:native("ColumnTypeLength") function columnTypeLength(index: go.GoInt): go.Tuple<{ length: go.Int64, ok: Bool }>;
    @:native("Columns") function columns(): go.Slice<String>;
    @:native("Next") function next(dest: go.Slice<go.database.sql.driver.Value>): go.Error;

}