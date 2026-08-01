package go.regexp.syntax;

@:go.Type({ name: "Op", instanceName: "syntax.Op", imports: ["regexp/syntax"] })
extern typedef Op = haxe.extern.EitherType<go.UInt8, {
    @:native("String") function string(): (String);

}>