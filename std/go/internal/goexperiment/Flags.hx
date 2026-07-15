package go.internal.goexperiment;

@:structInit
@:go.Type({ name: "Flags", instanceName: "goexperiment.Flags", imports: ["internal/goexperiment"] })
extern class Flags {

    @:native("FieldTrack") var fieldTrack: Bool;
    @:native("PreemptibleLoops") var preemptibleLoops: Bool;
    @:native("StaticLockRanking") var staticLockRanking: Bool;
    @:native("BoringCrypto") var boringCrypto: Bool;
    @:native("RegabiWrappers") var regabiWrappers: Bool;
    @:native("RegabiArgs") var regabiArgs: Bool;
    @:native("HeapMinimum512KiB") var heapMinimum512KiB: Bool;
    @:native("Arenas") var arenas: Bool;
    @:native("CgoCheck2") var cgoCheck2: Bool;
    @:native("LoopVar") var loopVar: Bool;
    @:native("NewInliner") var newInliner: Bool;
    @:native("Dwarf5") var dwarf5: Bool;
    @:native("JSONv2") var jSONv2: Bool;
    @:native("GreenTeaGC") var greenTeaGC: Bool;
    @:native("RandomizedHeapBase64") var randomizedHeapBase64: Bool;
    @:native("RuntimeFreegc") var runtimeFreegc: Bool;
    @:native("SizeSpecializedMalloc") var sizeSpecializedMalloc: Bool;
    @:native("GoroutineLeakProfile") var goroutineLeakProfile: Bool;
    @:native("SIMD") var SIMD: Bool;
    @:native("RuntimeSecret") var runtimeSecret: Bool;

function new(fieldTrack: Bool, preemptibleLoops: Bool, staticLockRanking: Bool, boringCrypto: Bool, regabiWrappers: Bool, regabiArgs: Bool, heapMinimum512KiB: Bool, arenas: Bool, cgoCheck2: Bool, loopVar: Bool, newInliner: Bool, dwarf5: Bool, jSONv2: Bool, greenTeaGC: Bool, randomizedHeapBase64: Bool, runtimeFreegc: Bool, sizeSpecializedMalloc: Bool, goroutineLeakProfile: Bool, SIMD: Bool, runtimeSecret: Bool);

}