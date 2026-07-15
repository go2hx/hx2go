package go.internal.coverage;

@:go.Type({ name: "cmerge", instanceName: "cmerge.cmerge", imports: ["internal/coverage/cmerge"] })
extern class Cmerge {

    @:native("ModeMergeRelaxed") static var ModeMergeRelaxed: go.internal.coverage.cmerge.ModeMergePolicy;
    @:native("ModeMergeStrict") static var ModeMergeStrict: go.internal.coverage.cmerge.ModeMergePolicy;

    @:go.Tuple("p0", "p1") @:native("SaturatingAdd") static function saturatingAdd(dst: go.UInt32, src: go.UInt32): go.Tuple<{ p0: go.UInt32, p1: Bool }>;

}