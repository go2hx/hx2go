package go.regexp.syntax;

@:go.Type({ name: "InstOp", instanceName: "syntax.InstOp", imports: ["regexp/syntax"] })
extern typedef InstOp = haxe.extern.EitherType<go.UInt8, {
    @:native("String") function string(): (String);

}>