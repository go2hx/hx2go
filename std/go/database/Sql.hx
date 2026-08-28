package go.database;

/**
    Package sql provides a generic interface around SQL (or SQL-like)
    databases.
    
    The sql package must be used in conjunction with a database driver.
    See https://golang.org/s/sqldrivers for a list of drivers.
    
    Drivers that do not support context cancellation will not return until
    after the query is completed.
    
    For usage examples, see the wiki page at
    https://golang.org/s/sqlwiki.
**/
@:go.Type({ name: "sql", instanceName: "sql.sql", imports: ["database/sql"] })
extern class Sql {

    /**
        Various isolation levels that drivers may support in [DB.BeginTx].
        If a driver does not support a given isolation level an error may be returned.
        
        See https://en.wikipedia.org/wiki/Isolation_(database_systems)#Isolation_levels.
    **/
    @:native("LevelDefault") static var levelDefault: go.database.sql.IsolationLevel;
    /**
        Various isolation levels that drivers may support in [DB.BeginTx].
        If a driver does not support a given isolation level an error may be returned.
        
        See https://en.wikipedia.org/wiki/Isolation_(database_systems)#Isolation_levels.
    **/
    @:native("LevelLinearizable") static var levelLinearizable: go.database.sql.IsolationLevel;
    /**
        Various isolation levels that drivers may support in [DB.BeginTx].
        If a driver does not support a given isolation level an error may be returned.
        
        See https://en.wikipedia.org/wiki/Isolation_(database_systems)#Isolation_levels.
    **/
    @:native("LevelReadCommitted") static var levelReadCommitted: go.database.sql.IsolationLevel;
    /**
        Various isolation levels that drivers may support in [DB.BeginTx].
        If a driver does not support a given isolation level an error may be returned.
        
        See https://en.wikipedia.org/wiki/Isolation_(database_systems)#Isolation_levels.
    **/
    @:native("LevelReadUncommitted") static var levelReadUncommitted: go.database.sql.IsolationLevel;
    /**
        Various isolation levels that drivers may support in [DB.BeginTx].
        If a driver does not support a given isolation level an error may be returned.
        
        See https://en.wikipedia.org/wiki/Isolation_(database_systems)#Isolation_levels.
    **/
    @:native("LevelRepeatableRead") static var levelRepeatableRead: go.database.sql.IsolationLevel;
    /**
        Various isolation levels that drivers may support in [DB.BeginTx].
        If a driver does not support a given isolation level an error may be returned.
        
        See https://en.wikipedia.org/wiki/Isolation_(database_systems)#Isolation_levels.
    **/
    @:native("LevelSerializable") static var levelSerializable: go.database.sql.IsolationLevel;
    /**
        Various isolation levels that drivers may support in [DB.BeginTx].
        If a driver does not support a given isolation level an error may be returned.
        
        See https://en.wikipedia.org/wiki/Isolation_(database_systems)#Isolation_levels.
    **/
    @:native("LevelSnapshot") static var levelSnapshot: go.database.sql.IsolationLevel;
    /**
        Various isolation levels that drivers may support in [DB.BeginTx].
        If a driver does not support a given isolation level an error may be returned.
        
        See https://en.wikipedia.org/wiki/Isolation_(database_systems)#Isolation_levels.
    **/
    @:native("LevelWriteCommitted") static var levelWriteCommitted: go.database.sql.IsolationLevel;

    /**
        Drivers returns a sorted list of the names of the registered drivers.
    **/
    @:native("Drivers") static function drivers(): (go.Slice<String>);
    /**
        Named provides a more concise way to create [NamedArg] values.
        
        Example usage:
        
        	db.ExecContext(ctx, `
        	    delete from Invoice
        	    where
        	        TimeCreated < @end
        	        and TimeCreated >= @start;`,
        	    sql.Named("start", startTime),
        	    sql.Named("end", endTime),
        	)
    **/
    @:native("Named") static function named(name: String, value: Dynamic): (go.database.sql.NamedArg);
    /**
        Open opens a database specified by its database driver name and a
        driver-specific data source name, usually consisting of at least a
        database name and connection information.
        
        Most users will open a database via a driver-specific connection
        helper function that returns a [*DB]. No database drivers are included
        in the Go standard library. See https://golang.org/s/sqldrivers for
        a list of third-party drivers.
        
        Open may just validate its arguments without creating a connection
        to the database. To verify that the data source name is valid, call
        [DB.Ping].
        
        The returned [DB] is safe for concurrent use by multiple goroutines
        and maintains its own pool of idle connections. Thus, the Open
        function should be called just once. It is rarely necessary to
        close a [DB].
    **/
    @:native("Open") static function open(driverName: String, dataSourceName: String): (go.Result<go.Pointer<go.database.sql.DB>>);
    /**
        OpenDB opens a database using a [driver.Connector], allowing drivers to
        bypass a string based data source name.
        
        Most users will open a database via a driver-specific connection
        helper function that returns a [*DB]. No database drivers are included
        in the Go standard library. See https://golang.org/s/sqldrivers for
        a list of third-party drivers.
        
        OpenDB may just validate its arguments without creating a connection
        to the database. To verify that the data source name is valid, call
        [DB.Ping].
        
        The returned [DB] is safe for concurrent use by multiple goroutines
        and maintains its own pool of idle connections. Thus, the OpenDB
        function should be called just once. It is rarely necessary to
        close a [DB].
    **/
    @:native("OpenDB") static function openDB(c: go.database.sql.driver.Connector): (go.Pointer<go.database.sql.DB>);
    /**
        Register makes a database driver available by the provided name.
        If Register is called twice with the same name or if driver is nil,
        it panics.
    **/
    @:native("Register") static function register(name: String, driver: go.database.sql.driver.Driver): Void;

}