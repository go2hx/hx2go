package go.database.sql.driver;

/**
    RowsColumnScanner extends the [Rows] interface by providing a way for the driver
    to scan directly into the user-provided destination.
    
    RowsColumnScanner supersedes the [Rows.Next] method.
    
    As of Go 1.27, database/sql will not call Next if a Rows implements RowsColumnScanner.
    Rows implementations may still implement the Next method to support older versions of Go.
**/
@:go.Type({ name: "RowsColumnScanner", instanceName: "driver.RowsColumnScanner", imports: ["database/sql/driver"] })
extern typedef RowsColumnScanner = {

    @:native("Close") function close(): (go.Error);
    @:native("Columns") function columns(): (go.Slice<std.String>);
    @:native("Next") function next(dest: go.Slice<go.database.sql.driver.Value>): (go.Error);
    @:native("NextRow") function nextRow(): (go.Error);
    @:native("ScanColumn") function scanColumn(scanCtx: go.database.sql.driver.ScanContext, index: go.GoInt, dest: Dynamic): (go.Error);

}