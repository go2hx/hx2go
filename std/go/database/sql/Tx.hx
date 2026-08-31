package go.database.sql;

/**
    Tx is an in-progress database transaction.
    
    A transaction must end with a call to [Tx.Commit] or [Tx.Rollback].
    
    After a call to [Tx.Commit] or [Tx.Rollback], all operations on the
    transaction fail with [ErrTxDone].
    
    The statements prepared for a transaction by calling
    the transaction's [Tx.Prepare] or [Tx.Stmt] methods are closed
    by the call to [Tx.Commit] or [Tx.Rollback].
**/
@:structInit
@:go.Type({ name: "Tx", instanceName: "sql.Tx", imports: ["database/sql"] })
extern class Tx {

    /**
        Commit commits the transaction.
    **/
    @:native("Commit") function commit(): (go.Error);
    /**
        Exec executes a query that doesn't return rows.
        For example: an INSERT and UPDATE.
        
        Exec uses [context.Background] internally; to specify the context, use
        [Tx.ExecContext].
    **/
    @:native("Exec") function exec(query: String, args: haxe.Rest<Dynamic>): (go.Result<go.database.sql.Result>);
    /**
        ExecContext executes a query that doesn't return rows.
        For example: an INSERT and UPDATE.
    **/
    @:native("ExecContext") function execContext(ctx: go.context.Context, query: String, args: haxe.Rest<Dynamic>): (go.Result<go.database.sql.Result>);
    /**
        Prepare creates a prepared statement for use within a transaction.
        
        The returned statement operates within the transaction and will be closed
        when the transaction has been committed or rolled back.
        
        To use an existing prepared statement on this transaction, see [Tx.Stmt].
        
        Prepare uses [context.Background] internally; to specify the context, use
        [Tx.PrepareContext].
    **/
    @:native("Prepare") function prepare(query: String): (go.Result<go.Pointer<go.database.sql.Stmt>>);
    /**
        PrepareContext creates a prepared statement for use within a transaction.
        
        The returned statement operates within the transaction and will be closed
        when the transaction has been committed or rolled back.
        
        To use an existing prepared statement on this transaction, see [Tx.Stmt].
        
        The provided context will be used for the preparation of the context, not
        for the execution of the returned statement. The returned statement
        will run in the transaction context.
    **/
    @:native("PrepareContext") function prepareContext(ctx: go.context.Context, query: String): (go.Result<go.Pointer<go.database.sql.Stmt>>);
    /**
        Query executes a query that returns rows, typically a SELECT.
        
        Query uses [context.Background] internally; to specify the context, use
        [Tx.QueryContext].
    **/
    @:native("Query") function query(query: String, args: haxe.Rest<Dynamic>): (go.Result<go.Pointer<go.database.sql.Rows>>);
    /**
        QueryContext executes a query that returns rows, typically a SELECT.
    **/
    @:native("QueryContext") function queryContext(ctx: go.context.Context, query: String, args: haxe.Rest<Dynamic>): (go.Result<go.Pointer<go.database.sql.Rows>>);
    /**
        QueryRow executes a query that is expected to return at most one row.
        QueryRow always returns a non-nil value. Errors are deferred until
        [Row]'s Scan method is called.
        If the query selects no rows, the [*Row.Scan] will return [ErrNoRows].
        Otherwise, the [*Row.Scan] scans the first selected row and discards
        the rest.
        
        QueryRow uses [context.Background] internally; to specify the context, use
        [Tx.QueryRowContext].
    **/
    @:native("QueryRow") function queryRow(query: String, args: haxe.Rest<Dynamic>): (go.Pointer<go.database.sql.Row>);
    /**
        QueryRowContext executes a query that is expected to return at most one row.
        QueryRowContext always returns a non-nil value. Errors are deferred until
        [Row]'s Scan method is called.
        If the query selects no rows, the [*Row.Scan] will return [ErrNoRows].
        Otherwise, the [*Row.Scan] scans the first selected row and discards
        the rest.
    **/
    @:native("QueryRowContext") function queryRowContext(ctx: go.context.Context, query: String, args: haxe.Rest<Dynamic>): (go.Pointer<go.database.sql.Row>);
    /**
        Rollback aborts the transaction.
    **/
    @:native("Rollback") function rollback(): (go.Error);
    /**
        Stmt returns a transaction-specific prepared statement from
        an existing statement.
        
        Example:
        
        	updateMoney, err := db.Prepare("UPDATE balance SET money=money+? WHERE id=?")
        	...
        	tx, err := db.Begin()
        	...
        	res, err := tx.Stmt(updateMoney).Exec(123.45, 98293203)
        
        The returned statement operates within the transaction and will be closed
        when the transaction has been committed or rolled back.
        
        Stmt uses [context.Background] internally; to specify the context, use
        [Tx.StmtContext].
    **/
    @:native("Stmt") function stmt(stmt: go.Pointer<go.database.sql.Stmt>): (go.Pointer<go.database.sql.Stmt>);
    /**
        StmtContext returns a transaction-specific prepared statement from
        an existing statement.
        
        Example:
        
        	updateMoney, err := db.Prepare("UPDATE balance SET money=money+? WHERE id=?")
        	...
        	tx, err := db.Begin()
        	...
        	res, err := tx.StmtContext(ctx, updateMoney).Exec(123.45, 98293203)
        
        The provided context is used for the preparation of the statement, not for the
        execution of the statement.
        
        The returned statement operates within the transaction and will be closed
        when the transaction has been committed or rolled back.
    **/
    @:native("StmtContext") function stmtContext(ctx: go.context.Context, stmt: go.Pointer<go.database.sql.Stmt>): (go.Pointer<go.database.sql.Stmt>);

}