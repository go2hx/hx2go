package go.database.sql;

@:structInit
@:go.Type({ name: "Stmt", instanceName: "sql.Stmt", imports: ["database/sql"] })
extern class Stmt {

    @:native("Close") function close(): go.Error;
    @:native("Exec") function exec(args: haxe.Rest<Dynamic>): go.Result<go.database.sql.Result>;
    @:native("ExecContext") function execContext(ctx: go.context.Context, args: haxe.Rest<Dynamic>): go.Result<go.database.sql.Result>;
    @:native("Query") function query(args: haxe.Rest<Dynamic>): go.Result<go.Pointer<go.database.sql.Rows>>;
    @:native("QueryContext") function queryContext(ctx: go.context.Context, args: haxe.Rest<Dynamic>): go.Result<go.Pointer<go.database.sql.Rows>>;
    @:native("QueryRow") function queryRow(args: haxe.Rest<Dynamic>): go.Pointer<go.database.sql.Row>;
    @:native("QueryRowContext") function queryRowContext(ctx: go.context.Context, args: haxe.Rest<Dynamic>): go.Pointer<go.database.sql.Row>;

}