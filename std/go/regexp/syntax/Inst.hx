package go.regexp.syntax;

/**
    An Inst is a single instruction in a regular expression program.
**/
@:structInit
@:go.Type({ name: "Inst", instanceName: "syntax.Inst", imports: ["regexp/syntax"] })
extern class Inst {

    @:native("Op") var op: go.regexp.syntax.InstOp;
    @:native("Out") var out: go.UInt32;
    @:native("Arg") var arg: go.UInt32;
    @:native("Rune") var rune: go.Slice<go.Rune>;

    function new(op: go.regexp.syntax.InstOp=cast 0, out: go.UInt32=0, arg: go.UInt32=0, rune: go.Slice<go.Rune>=null);

    /**
        MatchEmptyWidth reports whether the instruction matches
        an empty string between the runes before and after.
        It should only be called when i.Op == [InstEmptyWidth].
    **/
    @:native("MatchEmptyWidth") function matchEmptyWidth(before: go.Rune, after: go.Rune): (Bool);
    /**
        MatchRune reports whether the instruction matches (and consumes) r.
        It should only be called when i.Op == [InstRune].
    **/
    @:native("MatchRune") function matchRune(r: go.Rune): (Bool);
    /**
        MatchRunePos checks whether the instruction matches (and consumes) r.
        If so, MatchRunePos returns the index of the matching rune pair
        (or, when len(i.Rune) == 1, rune singleton).
        If not, MatchRunePos returns -1.
        MatchRunePos should only be called when i.Op == [InstRune].
    **/
    @:native("MatchRunePos") function matchRunePos(r: go.Rune): (go.GoInt);
    @:native("String") function string(): (String);

}