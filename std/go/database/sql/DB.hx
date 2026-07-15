package go.database.sql;

@:structInit
@:go.Type({ name: "DB", instanceName: "sql.DB", imports: ["database/sql"] })
extern class DB {

    @:native("Begin") function begin(): go.Result<go.Pointer<go.database.sql.Tx>>;
    @:native("BeginTx") function beginTx(ctx: go.context.Context, opts: go.Pointer<go.database.sql.TxOptions>): go.Result<go.Pointer<go.database.sql.Tx>>;
    @:native("Close") function close(): go.Error;
    @:native("Conn") function conn(ctx: go.context.Context): go.Result<go.Pointer<go.database.sql.Conn>>;
    @:native("Driver") function driver(): go.database.sql.driver.Driver;
    @:native("Exec") function exec(query: String, args: haxe.Rest<Dynamic>): go.Result<go.database.sql.Result>;
    @:native("ExecContext") function execContext(ctx: go.context.Context, query: String, args: haxe.Rest<Dynamic>): go.Result<go.database.sql.Result>;
    @:native("Ping") function ping(): go.Error;
    @:native("PingContext") function pingContext(ctx: go.context.Context): go.Error;
    @:native("Prepare") function prepare(query: String): go.Result<go.Pointer<go.database.sql.Stmt>>;
    @:native("PrepareContext") function prepareContext(ctx: go.context.Context, query: String): go.Result<go.Pointer<go.database.sql.Stmt>>;
    @:native("Query") function query(query: String, args: haxe.Rest<Dynamic>): go.Result<go.Pointer<go.database.sql.Rows>>;
    @:native("QueryContext") function queryContext(ctx: go.context.Context, query: String, args: haxe.Rest<Dynamic>): go.Result<go.Pointer<go.database.sql.Rows>>;
    @:native("QueryRow") function queryRow(query: String, args: haxe.Rest<Dynamic>): go.Pointer<go.database.sql.Row>;
    @:native("QueryRowContext") function queryRowContext(ctx: go.context.Context, query: String, args: haxe.Rest<Dynamic>): go.Pointer<go.database.sql.Row>;
    @:native("SetConnMaxIdleTime") function setConnMaxIdleTime(d: go.time.Duration): Void;
    @:native("SetConnMaxLifetime") function setConnMaxLifetime(d: go.time.Duration): Void;
    @:native("SetMaxIdleConns") function setMaxIdleConns(n: go.GoInt): Void;
    @:native("SetMaxOpenConns") function setMaxOpenConns(n: go.GoInt): Void;
    @:native("Stats") function stats(): go.database.sql.DBStats;

}