package go.internal.buildcfg;

@:structInit
@:go.Type({ name: "GoarmFeatures", instanceName: "buildcfg.GoarmFeatures", imports: ["internal/buildcfg"] })
extern class GoarmFeatures {

    @:native("Version") var version: go.GoInt;
    @:native("SoftFloat") var softFloat: Bool;

function new(version: go.GoInt, softFloat: Bool);

    @:native("String") function string(): String;

}