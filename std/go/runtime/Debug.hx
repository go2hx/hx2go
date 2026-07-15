package go.runtime;

@:go.Type({ name: "debug", instanceName: "debug.debug", imports: ["runtime/debug"] })
extern class Debug {

    @:native("FreeOSMemory") static function freeOSMemory(): Void;
    @:native("ParseBuildInfo") static function parseBuildInfo(data: String): go.Result<go.Pointer<go.runtime.debug.BuildInfo>>;
    @:native("PrintStack") static function printStack(): Void;
    @:go.Tuple("info", "ok") @:native("ReadBuildInfo") static function readBuildInfo(): go.Tuple<{ info: go.Pointer<go.runtime.debug.BuildInfo>, ok: Bool }>;
    @:native("ReadGCStats") static function readGCStats(stats: go.Pointer<go.runtime.debug.GCStats>): Void;
    @:native("SetCrashOutput") static function setCrashOutput(f: go.Pointer<go.os.File>, opts: go.runtime.debug.CrashOptions): go.Error;
    @:native("SetGCPercent") static function setGCPercent(percent: go.GoInt): go.GoInt;
    @:native("SetMaxStack") static function setMaxStack(bytes: go.GoInt): go.GoInt;
    @:native("SetMaxThreads") static function setMaxThreads(threads: go.GoInt): go.GoInt;
    @:native("SetMemoryLimit") static function setMemoryLimit(limit: go.Int64): go.Int64;
    @:native("SetPanicOnFault") static function setPanicOnFault(enabled: Bool): Bool;
    @:native("SetTraceback") static function setTraceback(level: String): Void;
    @:native("Stack") static function stack(): go.Slice<go.Byte>;
    @:native("WriteHeapDump") static function writeHeapDump(fd: go.UIntPtr): Void;

}