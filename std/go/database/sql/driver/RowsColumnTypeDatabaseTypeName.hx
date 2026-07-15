package go.database.sql.driver;

@:go.Type({ name: "RowsColumnTypeDatabaseTypeName", instanceName: "driver.RowsColumnTypeDatabaseTypeName", imports: ["database/sql/driver"] })
extern typedef RowsColumnTypeDatabaseTypeName = {

    @:native("Close") function close(): go.Error;
    @:native("ColumnTypeDatabaseTypeName") function columnTypeDatabaseTypeName(index: go.GoInt): String;
    @:native("Columns") function columns(): go.Slice<String>;
    @:native("Next") function next(dest: go.Slice<go.database.sql.driver.Value>): go.Error;

}