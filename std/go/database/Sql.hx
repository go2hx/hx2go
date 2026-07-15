package go.database;

@:go.Type({ name: "sql", instanceName: "sql.sql", imports: ["database/sql"] })
extern class Sql {

    @:native("LevelDefault") static var LevelDefault: go.database.sql.IsolationLevel;
    @:native("LevelLinearizable") static var LevelLinearizable: go.database.sql.IsolationLevel;
    @:native("LevelReadCommitted") static var LevelReadCommitted: go.database.sql.IsolationLevel;
    @:native("LevelReadUncommitted") static var LevelReadUncommitted: go.database.sql.IsolationLevel;
    @:native("LevelRepeatableRead") static var LevelRepeatableRead: go.database.sql.IsolationLevel;
    @:native("LevelSerializable") static var LevelSerializable: go.database.sql.IsolationLevel;
    @:native("LevelSnapshot") static var LevelSnapshot: go.database.sql.IsolationLevel;
    @:native("LevelWriteCommitted") static var LevelWriteCommitted: go.database.sql.IsolationLevel;

    @:native("Drivers") static function drivers(): go.Slice<String>;
    @:native("Named") static function named(name: String, value: Dynamic): go.database.sql.NamedArg;
    @:native("Open") static function open(driverName: String, dataSourceName: String): go.Result<go.Pointer<go.database.sql.DB>>;
    @:native("OpenDB") static function openDB(c: go.database.sql.driver.Connector): go.Pointer<go.database.sql.DB>;
    @:native("Register") static function register(name: String, driver: go.database.sql.driver.Driver): Void;

}