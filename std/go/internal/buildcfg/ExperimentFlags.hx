package go.internal.buildcfg;

@:structInit
@:go.Type({ name: "ExperimentFlags", instanceName: "buildcfg.ExperimentFlags", imports: ["internal/buildcfg"] })
extern class ExperimentFlags {

    @:native("Flags") var flags: go.internal.goexperiment.Flags;

function new(flags: go.internal.goexperiment.Flags);

    @:native("All") function all(): go.Slice<String>;
    @:native("Enabled") function enabled(): go.Slice<String>;
    @:native("String") function string(): String;

}