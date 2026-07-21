package go.regexp.syntax;

@:structInit
@:go.Type({ name: "Prog", instanceName: "syntax.Prog", imports: ["regexp/syntax"] })
extern class Prog {

    @:native("Inst") var inst: go.Slice<go.regexp.syntax.Inst>;
    @:native("Start") var start: go.GoInt;
    @:native("NumCap") var numCap: go.GoInt;

    function new(inst: go.Slice<go.regexp.syntax.Inst>, start: go.GoInt, numCap: go.GoInt);

    @:go.Tuple("prefix", "complete") @:native("Prefix") function prefix(): (go.Tuple<{ prefix: String, complete: Bool }>);
    @:native("StartCond") function startCond(): (go.regexp.syntax.EmptyOp);
    @:native("String") function string(): (String);

}