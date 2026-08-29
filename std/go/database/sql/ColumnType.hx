package go.database.sql;

/**
    ColumnType contains the name and type of a column.
**/
@:structInit
@:go.Type({ name: "ColumnType", instanceName: "sql.ColumnType", imports: ["database/sql"] })
extern class ColumnType {

    /**
        DatabaseTypeName returns the database system name of the column type. If an empty
        string is returned, then the driver type name is not supported.
        Consult your driver documentation for a list of driver data types. [ColumnType.Length] specifiers
        are not included.
        Common type names include "VARCHAR", "TEXT", "NVARCHAR", "DECIMAL", "BOOL",
        "INT", and "BIGINT".
    **/
    @:native("DatabaseTypeName") function databaseTypeName(): (String);
    /**
        DecimalSize returns the scale and precision of a decimal type.
        If not applicable or if not supported ok is false.
    **/
    @:go.Tuple("precision", "scale", "ok") @:native("DecimalSize") function decimalSize(): (go.Tuple<{ precision: go.Int64, scale: go.Int64, ok: Bool }>);
    /**
        Length returns the column type length for variable length column types such
        as text and binary field types. If the type length is unbounded the value will
        be [math.MaxInt64] (any database limits will still apply).
        If the column type is not variable length, such as an int, or if not supported
        by the driver ok is false.
    **/
    @:go.Tuple("length", "ok") @:native("Length") function length(): (go.Tuple<{ length: go.Int64, ok: Bool }>);
    /**
        Name returns the name or alias of the column.
    **/
    @:native("Name") function name(): (String);
    /**
        Nullable reports whether the column may be null.
        If a driver does not support this property ok will be false.
    **/
    @:go.Tuple("nullable", "ok") @:native("Nullable") function nullable(): (go.Tuple<{ nullable: Bool, ok: Bool }>);
    /**
        ScanType returns a Go type suitable for scanning into using [Rows.Scan].
        If a driver does not support this property ScanType will return
        the type of an empty interface.
    **/
    @:native("ScanType") function scanType(): (go.reflect.Type);

}