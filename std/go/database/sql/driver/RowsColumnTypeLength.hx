package go.database.sql.driver;

/**
    RowsColumnTypeLength may be implemented by [Rows]. It should return the length
    of the column type if the column is a variable length type. If the column is
    not a variable length type ok should return false.
    If length is not limited other than system limits, it should return [math.MaxInt64].
    The following are examples of returned values for various types:
    
    	TEXT          (math.MaxInt64, true)
    	varchar(10)   (10, true)
    	nvarchar(10)  (10, true)
    	decimal       (0, false)
    	int           (0, false)
    	bytea(30)     (30, true)
**/
@:go.Type({ name: "RowsColumnTypeLength", instanceName: "driver.RowsColumnTypeLength", imports: ["database/sql/driver"] })
extern typedef RowsColumnTypeLength = {

    @:native("Close") function close(): (go.Error);
    @:go.Tuple("length", "ok") @:native("ColumnTypeLength") function columnTypeLength(index: go.GoInt): (go.Tuple<{ length: go.Int64, ok: Bool }>);
    @:native("Columns") function columns(): (go.Slice<std.String>);
    @:native("Next") function next(dest: go.Slice<go.database.sql.driver.Value>): (go.Error);

}