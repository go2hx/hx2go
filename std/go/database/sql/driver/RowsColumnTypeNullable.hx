package go.database.sql.driver;

/**
    RowsColumnTypeNullable may be implemented by [Rows]. The nullable value should
    be true if it is known the column may be null, or false if the column is known
    to be not nullable.
    If the column nullability is unknown, ok should be false.
**/
@:go.Type({ name: "RowsColumnTypeNullable", instanceName: "driver.RowsColumnTypeNullable", imports: ["database/sql/driver"] })
extern typedef RowsColumnTypeNullable = {

    @:native("Close") function close(): (go.Error);
    @:go.Tuple("nullable", "ok") @:native("ColumnTypeNullable") function columnTypeNullable(index: go.GoInt): (go.Tuple<{ nullable: Bool, ok: Bool }>);
    @:native("Columns") function columns(): (go.Slice<std.String>);
    @:native("Next") function next(dest: go.Slice<go.database.sql.driver.Value>): (go.Error);

}