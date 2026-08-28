package go.regexp.syntax;

/**
    An Error describes a failure to parse a regular expression
    and gives the offending expression.
**/
@:structInit
@:go.Type({ name: "Error", instanceName: "syntax.Error", imports: ["regexp/syntax"] })
extern class Error {

    @:native("Code") var code: go.regexp.syntax.ErrorCode;
    @:native("Expr") var expr: String;

    function new(code: go.regexp.syntax.ErrorCode=cast "", expr: String="");

    @:native("Error") function error(): (String);

}