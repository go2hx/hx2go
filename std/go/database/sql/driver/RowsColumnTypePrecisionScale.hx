package go.database.sql.driver;

@:go.Type({ name: "RowsColumnTypePrecisionScale", instanceName: "driver.RowsColumnTypePrecisionScale", imports: ["database/sql/driver"] })
extern typedef RowsColumnTypePrecisionScale = {

    @:native("Close") function close(): go.Error;
    @:go.Tuple("precision", "scale", "ok") @:native("ColumnTypePrecisionScale") function columnTypePrecisionScale(index: go.GoInt): go.Tuple<{ precision: go.Int64, scale: go.Int64, ok: Bool }>;
    @:native("Columns") function columns(): go.Slice<String>;
    @:native("Next") function next(dest: go.Slice<go.database.sql.driver.Value>): go.Error;

}