package go.regexp.syntax;

/**
    An InstOp is an instruction opcode.
**/
@:go.Type({ name: "InstOp", instanceName: "syntax.InstOp", imports: ["regexp/syntax"] })
extern typedef InstOp = haxe.extern.EitherType<go.UInt8, {
    @:native("String") function string(): (String);

}>