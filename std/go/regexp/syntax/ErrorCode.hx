package go.regexp.syntax;

@:go.Type({ name: "ErrorCode", instanceName: "syntax.ErrorCode", imports: ["regexp/syntax"] })
extern typedef ErrorCode = haxe.extern.EitherType<String, {
    @:native("String") function string(): (String);

}>