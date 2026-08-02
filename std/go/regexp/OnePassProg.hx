package go.regexp;

@:structInit
@:go.Type({ name: "onePassProg", instanceName: "regexp.onePassProg", imports: ["regexp"] })
extern class OnePassProg {

    @:native("Inst") var inst: go.Slice<go.regexp.OnePassInst>;
    @:native("Start") var start: go.GoInt;
    @:native("NumCap") var numCap: go.GoInt;

    function new(inst: go.Slice<go.regexp.OnePassInst>, start: go.GoInt, numCap: go.GoInt);

}