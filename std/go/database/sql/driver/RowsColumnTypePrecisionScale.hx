package go.database.sql.driver;

/**
    RowsColumnTypePrecisionScale may be implemented by [Rows]. It should return
    the precision and scale for decimal types. If not applicable, ok should be false.
    The following are examples of returned values for various types:
    
    	decimal(38, 4)    (38, 4, true)
    	int               (0, 0, false)
    	decimal           (math.MaxInt64, math.MaxInt64, true)
**/
@:go.Type({ name: "RowsColumnTypePrecisionScale", instanceName: "driver.RowsColumnTypePrecisionScale", imports: ["database/sql/driver"] })
extern typedef RowsColumnTypePrecisionScale = {

    @:native("Close") function close(): (go.Error);
    @:go.Tuple("precision", "scale", "ok") @:native("ColumnTypePrecisionScale") function columnTypePrecisionScale(index: go.GoInt): (go.Tuple<{ precision: go.Int64, scale: go.Int64, ok: Bool }>);
    @:native("Columns") function columns(): (go.Slice<std.String>);
    @:native("Next") function next(dest: go.Slice<go.database.sql.driver.Value>): (go.Error);

}