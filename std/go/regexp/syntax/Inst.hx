package go.regexp.syntax;

@:structInit
@:go.Type({ name: "Inst", instanceName: "syntax.Inst", imports: ["regexp/syntax"] })
extern class Inst {

    @:native("Op") var op: go.regexp.syntax.InstOp;
    @:native("Out") var out: go.UInt32;
    @:native("Arg") var arg: go.UInt32;
    @:native("Rune") var rune: go.Slice<go.Rune>;

function new(op: go.regexp.syntax.InstOp, out: go.UInt32, arg: go.UInt32, rune: go.Slice<go.Rune>);

    @:native("MatchEmptyWidth") function matchEmptyWidth(before: go.Rune, after: go.Rune): Bool;
    @:native("MatchRune") function matchRune(r: go.Rune): Bool;
    @:native("MatchRunePos") function matchRunePos(r: go.Rune): go.GoInt;
    @:native("String") function string(): String;

}