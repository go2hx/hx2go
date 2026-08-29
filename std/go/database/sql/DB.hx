package go.database.sql;

/**
    DB is a database handle representing a pool of zero or more
    underlying connections. It's safe for concurrent use by multiple
    goroutines.
    
    The sql package creates and frees connections automatically; it
    also maintains a free pool of idle connections. If the database has
    a concept of per-connection state, such state can be reliably observed
    within a transaction ([Tx]) or connection ([Conn]). Once [DB.Begin] is called, the
    returned [Tx] is bound to a single connection. Once [Tx.Commit] or
    [Tx.Rollback] is called on the transaction, that transaction's
    connection is returned to [DB]'s idle connection pool. The pool size
    can be controlled with [DB.SetMaxIdleConns].
**/
@:structInit
@:go.Type({ name: "DB", instanceName: "sql.DB", imports: ["database/sql"] })
extern class DB {

    /**
        Begin starts a transaction. The default isolation level is dependent on
        the driver.
        
        Begin uses [context.Background] internally; to specify the context, use
        [DB.BeginTx].
    **/
    @:native("Begin") function begin(): (go.Result<go.Pointer<go.database.sql.Tx>>);
    /**
        BeginTx starts a transaction.
        
        The provided context is used until the transaction is committed or rolled back.
        If the context is canceled, the sql package will roll back
        the transaction. [Tx.Commit] will return an error if the context provided to
        BeginTx is canceled.
        
        The provided [TxOptions] is optional and may be nil if defaults should be used.
        If a non-default isolation level is used that the driver doesn't support,
        an error will be returned.
    **/
    @:native("BeginTx") function beginTx(ctx: go.context.Context, opts: go.Pointer<go.database.sql.TxOptions>): (go.Result<go.Pointer<go.database.sql.Tx>>);
    /**
        Close closes the database and prevents new queries from starting.
        Close then waits for all queries that have started processing on the server
        to finish.
        
        It is rare to Close a [DB], as the [DB] handle is meant to be
        long-lived and shared between many goroutines.
    **/
    @:native("Close") function close(): (go.Error);
    /**
        Conn returns a single connection by either opening a new connection
        or returning an existing connection from the connection pool. Conn will
        block until either a connection is returned or ctx is canceled.
        Queries run on the same Conn will be run in the same database session.
        
        Every Conn must be returned to the database pool after use by
        calling [Conn.Close].
    **/
    @:native("Conn") function conn(ctx: go.context.Context): (go.Result<go.Pointer<go.database.sql.Conn>>);
    /**
        Driver returns the database's underlying driver.
    **/
    @:native("Driver") function driver(): (go.database.sql.driver.Driver);
    /**
        Exec executes a query without returning any rows.
        The args are for any placeholder parameters in the query.
        
        Exec uses [context.Background] internally; to specify the context, use
        [DB.ExecContext].
    **/
    @:native("Exec") function exec(query: String, args: haxe.Rest<Dynamic>): (go.Result<go.database.sql.Result>);
    /**
        ExecContext executes a query without returning any rows.
        The args are for any placeholder parameters in the query.
    **/
    @:native("ExecContext") function execContext(ctx: go.context.Context, query: String, args: haxe.Rest<Dynamic>): (go.Result<go.database.sql.Result>);
    /**
        Ping verifies a connection to the database is still alive,
        establishing a connection if necessary.
        
        Ping uses [context.Background] internally; to specify the context, use
        [DB.PingContext].
    **/
    @:native("Ping") function ping(): (go.Error);
    /**
        PingContext verifies a connection to the database is still alive,
        establishing a connection if necessary.
    **/
    @:native("PingContext") function pingContext(ctx: go.context.Context): (go.Error);
    /**
        Prepare creates a prepared statement for later queries or executions.
        Multiple queries or executions may be run concurrently from the
        returned statement.
        The caller must call the statement's [*Stmt.Close] method
        when the statement is no longer needed.
        
        Prepare uses [context.Background] internally; to specify the context, use
        [DB.PrepareContext].
    **/
    @:native("Prepare") function prepare(query: String): (go.Result<go.Pointer<go.database.sql.Stmt>>);
    /**
        PrepareContext creates a prepared statement for later queries or executions.
        Multiple queries or executions may be run concurrently from the
        returned statement.
        The caller must call the statement's [*Stmt.Close] method
        when the statement is no longer needed.
        
        The provided context is used for the preparation of the statement, not for the
        execution of the statement.
    **/
    @:native("PrepareContext") function prepareContext(ctx: go.context.Context, query: String): (go.Result<go.Pointer<go.database.sql.Stmt>>);
    /**
        Query executes a query that returns rows, typically a SELECT.
        The args are for any placeholder parameters in the query.
        
        Query uses [context.Background] internally; to specify the context, use
        [DB.QueryContext].
    **/
    @:native("Query") function query(query: String, args: haxe.Rest<Dynamic>): (go.Result<go.Pointer<go.database.sql.Rows>>);
    /**
        QueryContext executes a query that returns rows, typically a SELECT.
        The args are for any placeholder parameters in the query.
    **/
    @:native("QueryContext") function queryContext(ctx: go.context.Context, query: String, args: haxe.Rest<Dynamic>): (go.Result<go.Pointer<go.database.sql.Rows>>);
    /**
        QueryRow executes a query that is expected to return at most one row.
        QueryRow always returns a non-nil value. Errors are deferred until
        [Row]'s Scan method is called.
        If the query selects no rows, the [*Row.Scan] will return [ErrNoRows].
        Otherwise, [*Row.Scan] scans the first selected row and discards
        the rest.
        
        QueryRow uses [context.Background] internally; to specify the context, use
        [DB.QueryRowContext].
    **/
    @:native("QueryRow") function queryRow(query: String, args: haxe.Rest<Dynamic>): (go.Pointer<go.database.sql.Row>);
    /**
        QueryRowContext executes a query that is expected to return at most one row.
        QueryRowContext always returns a non-nil value. Errors are deferred until
        [Row]'s Scan method is called.
        If the query selects no rows, the [*Row.Scan] will return [ErrNoRows].
        Otherwise, [*Row.Scan] scans the first selected row and discards
        the rest.
    **/
    @:native("QueryRowContext") function queryRowContext(ctx: go.context.Context, query: String, args: haxe.Rest<Dynamic>): (go.Pointer<go.database.sql.Row>);
    /**
        SetConnMaxIdleTime sets the maximum amount of time a connection may be idle.
        
        Expired connections may be closed lazily before reuse.
        
        If d <= 0, connections are not closed due to a connection's idle time.
    **/
    @:native("SetConnMaxIdleTime") function setConnMaxIdleTime(d: go.time.Duration): Void;
    /**
        SetConnMaxLifetime sets the maximum amount of time a connection may be reused.
        
        Expired connections may be closed lazily before reuse.
        
        If d <= 0, connections are not closed due to a connection's age.
    **/
    @:native("SetConnMaxLifetime") function setConnMaxLifetime(d: go.time.Duration): Void;
    /**
        SetMaxIdleConns sets the maximum number of connections in the idle
        connection pool.
        
        If MaxOpenConns is greater than 0 but less than the new MaxIdleConns,
        then the new MaxIdleConns will be reduced to match the MaxOpenConns limit.
        
        If n <= 0, no idle connections are retained.
        
        The default max idle connections is currently 2. This may change in
        a future release.
    **/
    @:native("SetMaxIdleConns") function setMaxIdleConns(n: go.GoInt): Void;
    /**
        SetMaxOpenConns sets the maximum number of open connections to the database.
        
        If MaxIdleConns is greater than 0 and the new MaxOpenConns is less than
        MaxIdleConns, then MaxIdleConns will be reduced to match the new
        MaxOpenConns limit.
        
        If n <= 0, then there is no limit on the number of open connections.
        The default is 0 (unlimited).
    **/
    @:native("SetMaxOpenConns") function setMaxOpenConns(n: go.GoInt): Void;
    /**
        Stats returns database statistics.
    **/
    @:native("Stats") function stats(): (go.database.sql.DBStats);

}