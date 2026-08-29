package go.database.sql;

/**
    Package driver defines interfaces to be implemented by database
    drivers as used by package sql.
    
    Most code should use the [database/sql] package.
    
    The driver interface has evolved over time. Drivers should implement
    [Connector] and [DriverContext] interfaces.
    The Connector.Connect and Driver.Open methods should never return [ErrBadConn].
    [ErrBadConn] should only be returned from [Validator], [SessionResetter], or
    a query method if the connection is already in an invalid (e.g. closed) state.
    
    All [Conn] implementations should implement the following interfaces:
    [Pinger], [SessionResetter], and [Validator].
    
    If named parameters or context are supported, the driver's [Conn] should implement:
    [ExecerContext], [QueryerContext], [ConnPrepareContext], and [ConnBeginTx].
    
    To support custom data types, implement [NamedValueChecker]. [NamedValueChecker]
    also allows queries to accept per-query options as a parameter by returning
    [ErrRemoveArgument] from CheckNamedValue.
    
    If multiple result sets are supported, [Rows] should implement [RowsNextResultSet].
    If the driver knows how to describe the types present in the returned result
    it should implement the following interfaces: [RowsColumnTypeScanType],
    [RowsColumnTypeDatabaseTypeName], [RowsColumnTypeLength], [RowsColumnTypeNullable],
    and [RowsColumnTypePrecisionScale]. A given row value may also return a [Rows]
    type, which may represent a database cursor value.
    
    If a [Conn] implements [Validator], then the IsValid method is called
    before returning the connection to the connection pool. If an entry in the
    connection pool implements [SessionResetter], then ResetSession
    is called before reusing the connection for another query. If a connection is
    never returned to the connection pool but is immediately reused, then
    ResetSession is called prior to reuse but IsValid is not called.
**/
@:go.Type({ name: "driver", instanceName: "driver.driver", imports: ["database/sql/driver"] })
extern class Driver {

    /**
        Bool is a [ValueConverter] that converts input values to bool.
        
        The conversion rules are:
          - booleans are returned unchanged
          - for integer types,
            1 is true
            0 is false,
            other integers are an error
          - for strings and []byte, same rules as [strconv.ParseBool]
          - all other types are an error
    **/
    @:native("Bool") static var bool: go.database.sql.driver.BoolType;
    /**
        DefaultParameterConverter is the default implementation of
        [ValueConverter] that's used when a [Stmt] doesn't implement
        [ColumnConverter].
        
        DefaultParameterConverter returns its argument directly if
        IsValue(arg). Otherwise, if the argument implements [Valuer], its
        Value method is used to return a [Value]. As a fallback, the provided
        argument's underlying type is used to convert it to a [Value]:
        underlying integer types are converted to int64, floats to float64,
        bool, string, and []byte to themselves. If the argument is a nil
        pointer, defaultConverter.ConvertValue returns a nil [Value].
        If the argument is a non-nil pointer, it is dereferenced and
        defaultConverter.ConvertValue is called recursively. Other types
        are an error.
    **/
    @:native("DefaultParameterConverter") static var defaultParameterConverter: go.database.sql.driver.DefaultConverter;
    /**
        Int32 is a [ValueConverter] that converts input values to int64,
        respecting the limits of an int32 value.
    **/
    @:native("Int32") static var int32: go.database.sql.driver.Int32Type;
    /**
        ResultNoRows is a pre-defined [Result] for drivers to return when a DDL
        command (such as a CREATE TABLE) succeeds. It returns an error for both
        LastInsertId and [RowsAffected].
    **/
    @:native("ResultNoRows") static var resultNoRows: go.database.sql.driver.NoRows;
    /**
        String is a [ValueConverter] that converts its input to a string.
        If the value is already a string or []byte, it's unchanged.
        If the value is of another type, conversion to string is done
        with fmt.Sprintf("%v", v).
    **/
    @:native("String") static var string: go.database.sql.driver.StringType;

    /**
        IsScanValue is equivalent to [IsValue].
        It exists for compatibility.
    **/
    @:native("IsScanValue") static function isScanValue(v: Dynamic): (Bool);
    /**
        IsValue reports whether v is a valid [Value] parameter type.
    **/
    @:native("IsValue") static function isValue(v: Dynamic): (Bool);

}