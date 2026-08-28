package go.database.sql.driver;

/**
    RowsColumnTypeDatabaseTypeName may be implemented by [Rows]. It should return the
    database system type name without the length. Type names should be uppercase.
    Examples of returned types: "VARCHAR", "NVARCHAR", "VARCHAR2", "CHAR", "TEXT",
    "DECIMAL", "SMALLINT", "INT", "BIGINT", "BOOL", "[]BIGINT", "JSONB", "XML",
    "TIMESTAMP".
**/
@:go.Type({ name: "RowsColumnTypeDatabaseTypeName", instanceName: "driver.RowsColumnTypeDatabaseTypeName", imports: ["database/sql/driver"] })
extern typedef RowsColumnTypeDatabaseTypeName = {

    @:native("Close") function close(): (go.Error);
    @:native("ColumnTypeDatabaseTypeName") function columnTypeDatabaseTypeName(index: go.GoInt): (std.String);
    @:native("Columns") function columns(): (go.Slice<std.String>);
    @:native("Next") function next(dest: go.Slice<go.database.sql.driver.Value>): (go.Error);

}