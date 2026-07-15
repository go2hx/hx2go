package go.internal;

@:go.Type({ name: "goexperiment", instanceName: "goexperiment.goexperiment", imports: ["internal/goexperiment"] })
extern class Goexperiment {

    @:native("Arenas") static var Arenas: Bool;
    @:native("ArenasInt") static var ArenasInt: go.GoInt;
    @:native("BoringCrypto") static var BoringCrypto: Bool;
    @:native("BoringCryptoInt") static var BoringCryptoInt: go.GoInt;
    @:native("CgoCheck2") static var CgoCheck2: Bool;
    @:native("CgoCheck2Int") static var CgoCheck2Int: go.GoInt;
    @:native("Dwarf5") static var Dwarf5: Bool;
    @:native("Dwarf5Int") static var Dwarf5Int: go.GoInt;
    @:native("FieldTrack") static var FieldTrack: Bool;
    @:native("FieldTrackInt") static var FieldTrackInt: go.GoInt;
    @:native("GoroutineLeakProfile") static var GoroutineLeakProfile: Bool;
    @:native("GoroutineLeakProfileInt") static var GoroutineLeakProfileInt: go.GoInt;
    @:native("GreenTeaGC") static var GreenTeaGC: Bool;
    @:native("GreenTeaGCInt") static var GreenTeaGCInt: go.GoInt;
    @:native("HeapMinimum512KiB") static var HeapMinimum512KiB: Bool;
    @:native("HeapMinimum512KiBInt") static var HeapMinimum512KiBInt: go.GoInt;
    @:native("JSONv2") static var JSONv2: Bool;
    @:native("JSONv2Int") static var JSONv2Int: go.GoInt;
    @:native("LoopVar") static var LoopVar: Bool;
    @:native("LoopVarInt") static var LoopVarInt: go.GoInt;
    @:native("NewInliner") static var NewInliner: Bool;
    @:native("NewInlinerInt") static var NewInlinerInt: go.GoInt;
    @:native("PreemptibleLoops") static var PreemptibleLoops: Bool;
    @:native("PreemptibleLoopsInt") static var PreemptibleLoopsInt: go.GoInt;
    @:native("RandomizedHeapBase64") static var RandomizedHeapBase64: Bool;
    @:native("RandomizedHeapBase64Int") static var RandomizedHeapBase64Int: go.GoInt;
    @:native("RegabiArgs") static var RegabiArgs: Bool;
    @:native("RegabiArgsInt") static var RegabiArgsInt: go.GoInt;
    @:native("RegabiWrappers") static var RegabiWrappers: Bool;
    @:native("RegabiWrappersInt") static var RegabiWrappersInt: go.GoInt;
    @:native("RuntimeFreegc") static var RuntimeFreegc: Bool;
    @:native("RuntimeFreegcInt") static var RuntimeFreegcInt: go.GoInt;
    @:native("RuntimeSecret") static var RuntimeSecret: Bool;
    @:native("RuntimeSecretInt") static var RuntimeSecretInt: go.GoInt;
    @:native("SIMD") static var SIMD: Bool;
    @:native("SIMDInt") static var SIMDInt: go.GoInt;
    @:native("SizeSpecializedMalloc") static var SizeSpecializedMalloc: Bool;
    @:native("SizeSpecializedMallocInt") static var SizeSpecializedMallocInt: go.GoInt;
    @:native("StaticLockRanking") static var StaticLockRanking: Bool;
    @:native("StaticLockRankingInt") static var StaticLockRankingInt: go.GoInt;

}