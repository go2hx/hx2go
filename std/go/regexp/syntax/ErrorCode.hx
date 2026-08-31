package go.regexp.syntax;

/**
    An ErrorCode describes a failure to parse a regular expression.
**/
@:go.Type({ name: "ErrorCode", instanceName: "syntax.ErrorCode", imports: ["regexp/syntax"] })
extern typedef ErrorCode = haxe.extern.EitherType<String, {
    @:native("String") function string(): (String);

}>