package go.database.sql.driver;

/**
    Valuer is the interface providing the Value method.
    
    Errors returned by the [Value] method are wrapped by the database/sql package.
    This allows callers to use [errors.Is] for precise error handling after operations
    like [database/sql.Query], [database/sql.Exec], or [database/sql.QueryRow].
    
    Types implementing Valuer interface are able to convert
    themselves to a driver [Value].
**/
@:go.Type({ name: "Valuer", instanceName: "driver.Valuer", imports: ["database/sql/driver"] })
extern typedef Valuer = {

    @:native("Value") function value(): (go.Result<go.database.sql.driver.Value>);

}