package go.database.sql;

@:structInit
@:go.Type({ name: "Conn", instanceName: "sql.Conn", imports: ["database/sql"] })
extern class Conn {

    @:native("BeginTx") function beginTx(ctx: go.context.Context, opts: go.Pointer<go.database.sql.TxOptions>): go.Result<go.Pointer<go.database.sql.Tx>>;
    @:native("Close") function close(): go.Error;
    @:native("ExecContext") function execContext(ctx: go.context.Context, query: String, args: haxe.Rest<Dynamic>): go.Result<go.database.sql.Result>;
    @:native("PingContext") function pingContext(ctx: go.context.Context): go.Error;
    @:native("PrepareContext") function prepareContext(ctx: go.context.Context, query: String): go.Result<go.Pointer<go.database.sql.Stmt>>;
    @:native("QueryContext") function queryContext(ctx: go.context.Context, query: String, args: haxe.Rest<Dynamic>): go.Result<go.Pointer<go.database.sql.Rows>>;
    @:native("QueryRowContext") function queryRowContext(ctx: go.context.Context, query: String, args: haxe.Rest<Dynamic>): go.Pointer<go.database.sql.Row>;
    @:native("Raw") function raw(f: (driverConn: Dynamic) -> go.Error): go.Error;

}