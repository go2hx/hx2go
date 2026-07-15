package go.internal;

@:go.Type({ name: "buildcfg", instanceName: "buildcfg.buildcfg", imports: ["internal/buildcfg"] })
extern class Buildcfg {

    @:native("DefaultCGO_ENABLED") static var DefaultCGO_ENABLED: String;
    @:native("DefaultGO386") static var DefaultGO386: String;
    @:native("DefaultGOAMD64") static var DefaultGOAMD64: String;
    @:native("DefaultGOARM") static var DefaultGOARM: String;
    @:native("DefaultGOARM64") static var DefaultGOARM64: String;
    @:native("DefaultGOEXPERIMENT") static var DefaultGOEXPERIMENT: String;
    @:native("DefaultGOFIPS140") static var DefaultGOFIPS140: String;
    @:native("DefaultGOMIPS") static var DefaultGOMIPS: String;
    @:native("DefaultGOMIPS64") static var DefaultGOMIPS64: String;
    @:native("DefaultGOPPC64") static var DefaultGOPPC64: String;
    @:native("DefaultGORISCV64") static var DefaultGORISCV64: String;

    @:native("Experiment") static var Experiment: go.internal.buildcfg.ExperimentFlags;
    @:native("FramePointerEnabled") static var FramePointerEnabled: Bool;
    @:native("GO386") static var GO386: String;
    @:native("GOAMD64") static var GOAMD64: go.GoInt;
    @:native("GOARCH") static var GOARCH: String;
    @:native("GOARM") static var GOARM: go.internal.buildcfg.GoarmFeatures;
    @:native("GOARM64") static var GOARM64: go.internal.buildcfg.Goarm64Features;
    @:native("GOFIPS140") static var GOFIPS140: String;
    @:native("GOMIPS") static var GOMIPS: String;
    @:native("GOMIPS64") static var GOMIPS64: String;
    @:native("GOOS") static var GOOS: String;
    @:native("GOPPC64") static var GOPPC64: go.GoInt;
    @:native("GORISCV64") static var GORISCV64: go.GoInt;
    @:native("GOROOT") static var GOROOT: String;
    @:native("GO_LDSO") static var GO_LDSO: String;
    @:native("ToolTags") static var ToolTags: go.Slice<String>;
    @:native("Version") static var Version: String;

    @:native("Check") static function check(): Void;
    @:go.Tuple("name", "value") @:native("GOGOARCH") static function GOGOARCH(): go.Tuple<{ name: String, value: String }>;
    @:native("Getgoextlinkenabled") static function getgoextlinkenabled(): String;
    @:native("ParseGOEXPERIMENT") static function parseGOEXPERIMENT(goos: String, goarch: String, goexp: String): go.Result<go.Pointer<go.internal.buildcfg.ExperimentFlags>>;
    @:native("ParseGoarm64") static function parseGoarm64(v: String): go.Result<go.internal.buildcfg.Goarm64Features>;

}