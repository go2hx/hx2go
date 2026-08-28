package go.database.sql.driver;

/**
    ColumnConverter may be optionally implemented by [Stmt] if the
    statement is aware of its own columns' types and can convert from
    any type to a driver [Value].
    
    Deprecated: Drivers should implement [NamedValueChecker].
**/
@:go.Type({ name: "ColumnConverter", instanceName: "driver.ColumnConverter", imports: ["database/sql/driver"] })
extern typedef ColumnConverter = {

    @:native("ColumnConverter") function columnConverter(idx: go.GoInt): (go.database.sql.driver.ValueConverter);

}