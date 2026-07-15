package go.internal;

@:go.Type({ name: "platform", instanceName: "platform.platform", imports: ["internal/platform"] })
extern class Platform {

    @:native("List") static var List: go.Slice<go.internal.platform.OSArch>;

    @:native("ASanSupported") static function aSanSupported(goos: String, goarch: String): Bool;
    @:native("Broken") static function broken(goos: String, goarch: String): Bool;
    @:native("BuildModeSupported") static function buildModeSupported(compiler: String, buildmode: String, goos: String, goarch: String): Bool;
    @:native("CgoSupported") static function cgoSupported(goos: String, goarch: String): Bool;
    @:native("DefaultPIE") static function defaultPIE(goos: String, goarch: String, isRace: Bool): Bool;
    @:native("ExecutableHasDWARF") static function executableHasDWARF(goos: String, goarch: String): Bool;
    @:native("FirstClass") static function firstClass(goos: String, goarch: String): Bool;
    @:native("FuzzInstrumented") static function fuzzInstrumented(goos: String, goarch: String): Bool;
    @:native("FuzzSupported") static function fuzzSupported(goos: String, goarch: String): Bool;
    @:native("InternalLinkPIESupported") static function internalLinkPIESupported(goos: String, goarch: String): Bool;
    @:native("MSanSupported") static function mSanSupported(goos: String, goarch: String): Bool;
    @:native("MustLinkExternal") static function mustLinkExternal(goos: String, goarch: String, withCgo: Bool): Bool;
    @:native("RaceDetectorSupported") static function raceDetectorSupported(goos: String, goarch: String): Bool;

}