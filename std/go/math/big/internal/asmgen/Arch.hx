package go.math.big.internal.asmgen;

@:structInit
@:go.Type({ name: "Arch", instanceName: "asmgen.Arch", imports: ["math/big/internal/asmgen"] })
extern class Arch {

    @:native("Name") var name: String;
    @:native("Build") var build: String;
    @:native("WordBits") var wordBits: go.GoInt;
    @:native("WordBytes") var wordBytes: go.GoInt;
    @:native("CarrySafeLoop") var carrySafeLoop: Bool;

function new(name: String, build: String, wordBits: go.GoInt, wordBytes: go.GoInt, carrySafeLoop: Bool);

    @:native("HasShiftWide") function hasShiftWide(): Bool;

}