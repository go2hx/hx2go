package go.database.sql.driver;

/**
    NamedValueChecker may be optionally implemented by [Conn] or [Stmt]. It provides
    the driver more control to handle Go and database types beyond the default
    [Value] types allowed.
    
    The [database/sql] package checks for value checkers in the following order,
    stopping at the first found match: Stmt.NamedValueChecker, Conn.NamedValueChecker,
    Stmt.ColumnConverter, [DefaultParameterConverter].
    
    If CheckNamedValue returns [ErrRemoveArgument], the [NamedValue] will not be included in
    the final query arguments. This may be used to pass special options to
    the query itself.
    
    If [ErrSkip] is returned the column converter error checking
    path is used for the argument. Drivers may wish to return [ErrSkip] after
    they have exhausted their own special cases.
**/
@:go.Type({ name: "NamedValueChecker", instanceName: "driver.NamedValueChecker", imports: ["database/sql/driver"] })
extern typedef NamedValueChecker = {

    @:native("CheckNamedValue") function checkNamedValue(p0: go.Pointer<go.database.sql.driver.NamedValue>): (go.Error);

}