package go.regexp.syntax;

/**
    A Prog is a compiled regular expression program.
**/
@:structInit
@:go.Type({ name: "Prog", instanceName: "syntax.Prog", imports: ["regexp/syntax"] })
extern class Prog {

    @:native("Inst") var inst: go.Slice<go.regexp.syntax.Inst>;
    @:native("Start") var start: go.GoInt;
    @:native("NumCap") var numCap: go.GoInt;

    function new(inst: go.Slice<go.regexp.syntax.Inst>=null, start: go.GoInt=0, numCap: go.GoInt=0);

    /**
        Prefix returns a literal string that all matches for the
        regexp must start with. Complete is true if the prefix
        is the entire match.
    **/
    @:go.Tuple("prefix", "complete") @:native("Prefix") function prefix(): (go.Tuple<{ prefix: String, complete: Bool }>);
    /**
        StartCond returns the leading empty-width conditions that must
        be true in any match. It returns ^EmptyOp(0) if no matches are possible.
    **/
    @:native("StartCond") function startCond(): (go.regexp.syntax.EmptyOp);
    @:native("String") function string(): (String);

}