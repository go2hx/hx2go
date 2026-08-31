package go.database.sql.driver;

/**
    RowsColumnTypeScanType may be implemented by [Rows]. It should return
    the value type that can be used to scan types into. For example, the database
    column type "bigint" this should return "[reflect.TypeOf](int64(0))".
**/
@:go.Type({ name: "RowsColumnTypeScanType", instanceName: "driver.RowsColumnTypeScanType", imports: ["database/sql/driver"] })
extern typedef RowsColumnTypeScanType = {

    @:native("Close") function close(): (go.Error);
    @:native("ColumnTypeScanType") function columnTypeScanType(index: go.GoInt): (go.reflect.Type);
    @:native("Columns") function columns(): (go.Slice<std.String>);
    @:native("Next") function next(dest: go.Slice<go.database.sql.driver.Value>): (go.Error);

}