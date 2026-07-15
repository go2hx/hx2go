package go.internal;

@:go.Type({ name: "testenv", instanceName: "testenv.testenv", imports: ["internal/testenv"] })
extern class Testenv {

    @:native("NoSpecialBuildTypes") static var NoSpecialBuildTypes: go.internal.testenv.SpecialBuildTypes;
    @:native("Sigquit") static var Sigquit: go.syscall.Signal;

    @:native("Builder") static function builder(): String;
    @:native("CPUIsSlow") static function cPUIsSlow(): Bool;
    @:native("CPUProfilingBroken") static function cPUProfilingBroken(): Bool;
    @:native("CanInternalLink") static function canInternalLink(withCgo: Bool): Bool;
    @:native("CleanCmdEnv") static function cleanCmdEnv(cmd: go.Pointer<go.os.exec.Cmd>): go.Pointer<go.os.exec.Cmd>;
    @:native("Command") static function command(t: go.testing.TB, name: String, args: haxe.Rest<String>): go.Pointer<go.os.exec.Cmd>;
    @:native("CommandContext") static function commandContext(t: go.testing.TB, ctx: go.context.Context, name: String, args: haxe.Rest<String>): go.Pointer<go.os.exec.Cmd>;
    @:native("Executable") static function executable(t: go.testing.TB): String;
    @:native("GOROOT") static function GOROOT(t: go.testing.TB): String;
    @:native("GoTool") static function goTool(): go.Result<String>;
    @:native("GoToolPath") static function goToolPath(t: go.testing.TB): String;
    @:native("HasCGO") static function hasCGO(): Bool;
    @:native("HasExternalNetwork") static function hasExternalNetwork(): Bool;
    @:native("HasGoBuild") static function hasGoBuild(): Bool;
    @:native("HasGoRun") static function hasGoRun(): Bool;
    @:native("HasLink") static function hasLink(): Bool;
    @:native("HasParallelism") static function hasParallelism(): Bool;
    @:native("HasSymlink") static function hasSymlink(): Bool;
    @:native("MustHaveBuildMode") static function mustHaveBuildMode(t: go.testing.TB, buildmode: String): Void;
    @:native("MustHaveCGO") static function mustHaveCGO(t: go.testing.TB): Void;
    @:native("MustHaveExec") static function mustHaveExec(t: go.testing.TB): Void;
    @:native("MustHaveExecPath") static function mustHaveExecPath(t: go.testing.TB, path: String): Void;
    @:native("MustHaveExternalNetwork") static function mustHaveExternalNetwork(t: go.testing.TB): Void;
    @:native("MustHaveGoBuild") static function mustHaveGoBuild(t: go.testing.TB): Void;
    @:native("MustHaveGoRun") static function mustHaveGoRun(t: go.testing.TB): Void;
    @:native("MustHaveLink") static function mustHaveLink(t: go.testing.TB): Void;
    @:native("MustHaveParallelism") static function mustHaveParallelism(t: go.testing.TB): Void;
    @:native("MustHaveSource") static function mustHaveSource(t: go.testing.TB): Void;
    @:native("MustHaveSymlink") static function mustHaveSymlink(t: go.testing.TB): Void;
    @:native("MustInternalLink") static function mustInternalLink(t: go.testing.TB, with: go.internal.testenv.SpecialBuildTypes): Void;
    @:native("MustInternalLinkPIE") static function mustInternalLinkPIE(t: go.testing.TB): Void;
    @:native("OptimizationOff") static function optimizationOff(): Bool;
    @:native("ParallelOn64Bit") static function parallelOn64Bit(t: go.Pointer<go.testing.T>): Void;
    @:native("SkipFlaky") static function skipFlaky(t: go.testing.TB, issue: go.GoInt): Void;
    @:native("SkipFlakyNet") static function skipFlakyNet(t: go.testing.TB): Void;
    @:native("SkipIfOptimizationOff") static function skipIfOptimizationOff(t: go.testing.TB): Void;
    @:native("SkipIfShortAndSlow") static function skipIfShortAndSlow(t: go.testing.TB): Void;
    @:native("SyscallIsNotSupported") static function syscallIsNotSupported(err: go.Error): Bool;
    @:native("WriteImportcfg") static function writeImportcfg(t: go.testing.TB, dstPath: String, packageFiles: go.Map<String, String>, pkgs: haxe.Rest<String>): Void;

}