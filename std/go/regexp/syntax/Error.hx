package go.regexp.syntax;

@:structInit
@:go.Type({ name: "Error", instanceName: "syntax.Error", imports: ["regexp/syntax"] })
extern class Error {

    @:native("Code") var code: go.regexp.syntax.ErrorCode;
    @:native("Expr") var expr: String;

    function new(code: go.regexp.syntax.ErrorCode, expr: String);

    @:native("Error") function error(): (String);

}