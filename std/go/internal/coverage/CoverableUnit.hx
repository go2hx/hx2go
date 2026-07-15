package go.internal.coverage;

@:structInit
@:go.Type({ name: "CoverableUnit", instanceName: "coverage.CoverableUnit", imports: ["internal/coverage"] })
extern class CoverableUnit {

    @:native("StLine") var stLine: go.UInt32;
    @:native("StCol") var stCol: go.UInt32;
    @:native("EnLine") var enLine: go.UInt32;
    @:native("EnCol") var enCol: go.UInt32;
    @:native("NxStmts") var nxStmts: go.UInt32;
    @:native("Parent") var parent: go.UInt32;

function new(stLine: go.UInt32, stCol: go.UInt32, enLine: go.UInt32, enCol: go.UInt32, nxStmts: go.UInt32, parent: go.UInt32);

}