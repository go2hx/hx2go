package go.database.sql.driver;

@:go.Type({ name: "RowsColumnTypeScanType", instanceName: "driver.RowsColumnTypeScanType", imports: ["database/sql/driver"] })
extern typedef RowsColumnTypeScanType = {

    @:native("Close") function close(): go.Error;
    @:native("ColumnTypeScanType") function columnTypeScanType(index: go.GoInt): go.reflect.Type;
    @:native("Columns") function columns(): go.Slice<String>;
    @:native("Next") function next(dest: go.Slice<go.database.sql.driver.Value>): go.Error;

}