package go.runtime.debug;

/**
    BuildInfo represents the build information read from a Go binary.
**/
@:structInit
@:go.Type({ name: "BuildInfo", instanceName: "debug.BuildInfo", imports: ["runtime/debug"] })
extern class BuildInfo {

    @:native("GoVersion") var goVersion: String;
    @:native("Path") var path: String;
    @:native("Main") var main: go.runtime.debug.Module;
    @:native("Deps") var deps: go.Slice<go.Pointer<go.runtime.debug.Module>>;
    @:native("Settings") var settings: go.Slice<go.runtime.debug.BuildSetting>;

    function new(goVersion: String="", path: String="", main: go.runtime.debug.Module, deps: go.Slice<go.Pointer<go.runtime.debug.Module>>=null, settings: go.Slice<go.runtime.debug.BuildSetting>=null);

    /**
        String returns a string representation of a [BuildInfo].
    **/
    @:native("String") function string(): (String);

}