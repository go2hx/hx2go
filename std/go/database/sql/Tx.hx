package go.database.sql;

@:structInit
@:go.Type({ name: "Tx", instanceName: "sql.Tx", imports: ["database/sql"] })
extern class Tx {

    @:native("Commit") function commit(): go.Error;
    @:native("Exec") function exec(query: String, args: haxe.Rest<Dynamic>): go.Result<go.database.sql.Result>;
    @:native("ExecContext") function execContext(ctx: go.context.Context, query: String, args: haxe.Rest<Dynamic>): go.Result<go.database.sql.Result>;
    @:native("Prepare") function prepare(query: String): go.Result<go.Pointer<go.database.sql.Stmt>>;
    @:native("PrepareContext") function prepareContext(ctx: go.context.Context, query: String): go.Result<go.Pointer<go.database.sql.Stmt>>;
    @:native("Query") function query(query: String, args: haxe.Rest<Dynamic>): go.Result<go.Pointer<go.database.sql.Rows>>;
    @:native("QueryContext") function queryContext(ctx: go.context.Context, query: String, args: haxe.Rest<Dynamic>): go.Result<go.Pointer<go.database.sql.Rows>>;
    @:native("QueryRow") function queryRow(query: String, args: haxe.Rest<Dynamic>): go.Pointer<go.database.sql.Row>;
    @:native("QueryRowContext") function queryRowContext(ctx: go.context.Context, query: String, args: haxe.Rest<Dynamic>): go.Pointer<go.database.sql.Row>;
    @:native("Rollback") function rollback(): go.Error;
    @:native("Stmt") function stmt(stmt: go.Pointer<go.database.sql.Stmt>): go.Pointer<go.database.sql.Stmt>;
    @:native("StmtContext") function stmtContext(ctx: go.context.Context, stmt: go.Pointer<go.database.sql.Stmt>): go.Pointer<go.database.sql.Stmt>;

}