package go.internal.coverage.decodecounter;

@:structInit
@:go.Type({ name: "FuncPayload", instanceName: "decodecounter.FuncPayload", imports: ["internal/coverage/decodecounter"] })
extern class FuncPayload {

    @:native("PkgIdx") var pkgIdx: go.UInt32;
    @:native("FuncIdx") var funcIdx: go.UInt32;
    @:native("Counters") var counters: go.Slice<go.UInt32>;

function new(pkgIdx: go.UInt32, funcIdx: go.UInt32, counters: go.Slice<go.UInt32>);

}