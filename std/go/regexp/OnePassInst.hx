package go.regexp;

@:structInit
@:go.Type({ name: "onePassInst", instanceName: "regexp.onePassInst", imports: ["regexp"] })
extern class OnePassInst {

    @:native("Inst") var inst: go.regexp.syntax.Inst;
    @:native("Next") var next: go.Slice<go.UInt32>;
    @:native("Op") var op: go.regexp.syntax.InstOp;
    @:native("Out") var out: go.UInt32;
    @:native("Arg") var arg: go.UInt32;
    @:native("Rune") var rune: go.Slice<go.Rune>;

    function new(inst: go.regexp.syntax.Inst, next: go.Slice<go.UInt32>);

    @:native("MatchEmptyWidth") function matchEmptyWidth(before: go.Rune, after: go.Rune): (Bool);
    @:native("MatchRune") function matchRune(r: go.Rune): (Bool);
    @:native("MatchRunePos") function matchRunePos(r: go.Rune): (go.GoInt);
    @:native("String") function string(): (String);

}