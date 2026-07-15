package go.internal.coverage;

@:structInit
@:go.Type({ name: "FuncDesc", instanceName: "coverage.FuncDesc", imports: ["internal/coverage"] })
extern class FuncDesc {

    @:native("Funcname") var funcname: String;
    @:native("Srcfile") var srcfile: String;
    @:native("Units") var units: go.Slice<go.internal.coverage.CoverableUnit>;
    @:native("Lit") var lit: Bool;

function new(funcname: String, srcfile: String, units: go.Slice<go.internal.coverage.CoverableUnit>, lit: Bool);

}