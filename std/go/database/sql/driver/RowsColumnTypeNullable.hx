package go.database.sql.driver;

@:go.Type({ name: "RowsColumnTypeNullable", instanceName: "driver.RowsColumnTypeNullable", imports: ["database/sql/driver"] })
extern typedef RowsColumnTypeNullable = {

    @:native("Close") function close(): go.Error;
    @:go.Tuple("nullable", "ok") @:native("ColumnTypeNullable") function columnTypeNullable(index: go.GoInt): go.Tuple<{ nullable: Bool, ok: Bool }>;
    @:native("Columns") function columns(): go.Slice<String>;
    @:native("Next") function next(dest: go.Slice<go.database.sql.driver.Value>): go.Error;

}