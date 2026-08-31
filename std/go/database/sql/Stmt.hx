package go.database.sql;

/**
    Stmt is a prepared statement.
    A Stmt is safe for concurrent use by multiple goroutines.
    
    If a Stmt is prepared on a [Tx] or [Conn], it will be bound to a single
    underlying connection forever. If the [Tx] or [Conn] closes, the Stmt will
    become unusable and all operations will return an error.
    If a Stmt is prepared on a [DB], it will remain usable for the lifetime of the
    [DB]. When the Stmt needs to execute on a new underlying connection, it will
    prepare itself on the new connection automatically.
**/
@:structInit
@:go.Type({ name: "Stmt", instanceName: "sql.Stmt", imports: ["database/sql"] })
extern class Stmt {

    /**
        Close closes the statement.
    **/
    @:native("Close") function close(): (go.Error);
    /**
        Exec executes a prepared statement with the given arguments and
        returns a [Result] summarizing the effect of the statement.
        
        Exec uses [context.Background] internally; to specify the context, use
        [Stmt.ExecContext].
    **/
    @:native("Exec") function exec(args: haxe.Rest<Dynamic>): (go.Result<go.database.sql.Result>);
    /**
        ExecContext executes a prepared statement with the given arguments and
        returns a [Result] summarizing the effect of the statement.
    **/
    @:native("ExecContext") function execContext(ctx: go.context.Context, args: haxe.Rest<Dynamic>): (go.Result<go.database.sql.Result>);
    /**
        Query executes a prepared query statement with the given arguments
        and returns the query results as a *Rows.
        
        Query uses [context.Background] internally; to specify the context, use
        [Stmt.QueryContext].
    **/
    @:native("Query") function query(args: haxe.Rest<Dynamic>): (go.Result<go.Pointer<go.database.sql.Rows>>);
    /**
        QueryContext executes a prepared query statement with the given arguments
        and returns the query results as a [*Rows].
    **/
    @:native("QueryContext") function queryContext(ctx: go.context.Context, args: haxe.Rest<Dynamic>): (go.Result<go.Pointer<go.database.sql.Rows>>);
    /**
        QueryRow executes a prepared query statement with the given arguments.
        If an error occurs during the execution of the statement, that error will
        be returned by a call to Scan on the returned [*Row], which is always non-nil.
        If the query selects no rows, the [*Row.Scan] will return [ErrNoRows].
        Otherwise, the [*Row.Scan] scans the first selected row and discards
        the rest.
        
        Example usage:
        
        	var name string
        	err := nameByUseridStmt.QueryRow(id).Scan(&name)
        
        QueryRow uses [context.Background] internally; to specify the context, use
        [Stmt.QueryRowContext].
    **/
    @:native("QueryRow") function queryRow(args: haxe.Rest<Dynamic>): (go.Pointer<go.database.sql.Row>);
    /**
        QueryRowContext executes a prepared query statement with the given arguments.
        If an error occurs during the execution of the statement, that error will
        be returned by a call to Scan on the returned [*Row], which is always non-nil.
        If the query selects no rows, the [*Row.Scan] will return [ErrNoRows].
        Otherwise, the [*Row.Scan] scans the first selected row and discards
        the rest.
    **/
    @:native("QueryRowContext") function queryRowContext(ctx: go.context.Context, args: haxe.Rest<Dynamic>): (go.Pointer<go.database.sql.Row>);

}