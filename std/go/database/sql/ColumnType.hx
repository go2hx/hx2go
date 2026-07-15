package go.database.sql;

@:structInit
@:go.Type({ name: "ColumnType", instanceName: "sql.ColumnType", imports: ["database/sql"] })
extern class ColumnType {

    @:native("DatabaseTypeName") function databaseTypeName(): String;
    @:go.Tuple("precision", "scale", "ok") @:native("DecimalSize") function decimalSize(): go.Tuple<{ precision: go.Int64, scale: go.Int64, ok: Bool }>;
    @:go.Tuple("length", "ok") @:native("Length") function length(): go.Tuple<{ length: go.Int64, ok: Bool }>;
    @:native("Name") function name(): String;
    @:go.Tuple("nullable", "ok") @:native("Nullable") function nullable(): go.Tuple<{ nullable: Bool, ok: Bool }>;
    @:native("ScanType") function scanType(): go.reflect.Type;

}