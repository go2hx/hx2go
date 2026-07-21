package go;

@:go.Type({ name: "runtime", instanceName: "runtime.runtime", imports: ["runtime"] })
extern class Runtime {

    @:native("Compiler") static var Compiler: String;
    @:native("GOARCH") static var GOARCH: String;
    @:native("GOOS") static var GOOS: String;

    @:native("MemProfileRate") static var memProfileRate: go.GoInt;

    @:native("AddCleanup") static function addCleanup<T: Dynamic, S: Dynamic>(ptr: go.Pointer<T>, cleanup: (p0: S) -> Void, arg: S): (go.runtime.Cleanup);
    @:go.Tuple("n", "ok") @:native("BlockProfile") static function blockProfile(p: go.Slice<go.runtime.BlockProfileRecord>): (go.Tuple<{ n: go.GoInt, ok: Bool }>);
    @:native("Breakpoint") static function breakpoint(): Void;
    @:native("CPUProfile") static function cPUProfile(): (go.Slice<go.Byte>);
    @:go.Tuple("pc", "file", "line", "ok") @:native("Caller") static function caller(skip: go.GoInt): (go.Tuple<{ pc: go.UIntPtr, file: String, line: go.GoInt, ok: Bool }>);
    @:native("Callers") static function callers(skip: go.GoInt, pc: go.Slice<go.UIntPtr>): (go.GoInt);
    @:native("CallersFrames") static function callersFrames(callers: go.Slice<go.UIntPtr>): (go.Pointer<go.runtime.Frames>);
    @:native("FuncForPC") static function funcForPC(pc: go.UIntPtr): (go.Pointer<go.runtime.Func>);
    @:native("GC") static function GC(): Void;
    @:native("GOMAXPROCS") static function GOMAXPROCS(n: go.GoInt): (go.GoInt);
    @:native("GOROOT") static function GOROOT(): (String);
    @:native("Goexit") static function goexit(): Void;
    @:go.Tuple("n", "ok") @:native("GoroutineProfile") static function goroutineProfile(p: go.Slice<go.runtime.StackRecord>): (go.Tuple<{ n: go.GoInt, ok: Bool }>);
    @:native("Gosched") static function gosched(): Void;
    @:native("KeepAlive") static function keepAlive(x: Dynamic): Void;
    @:native("LockOSThread") static function lockOSThread(): Void;
    @:go.Tuple("n", "ok") @:native("MemProfile") static function memProfile(p: go.Slice<go.runtime.MemProfileRecord>, inuseZero: Bool): (go.Tuple<{ n: go.GoInt, ok: Bool }>);
    @:go.Tuple("n", "ok") @:native("MutexProfile") static function mutexProfile(p: go.Slice<go.runtime.BlockProfileRecord>): (go.Tuple<{ n: go.GoInt, ok: Bool }>);
    @:native("NumCPU") static function numCPU(): (go.GoInt);
    @:native("NumCgoCall") static function numCgoCall(): (go.Int64);
    @:native("NumGoroutine") static function numGoroutine(): (go.GoInt);
    @:native("ReadMemStats") static function readMemStats(m: go.Pointer<go.runtime.MemStats>): Void;
    @:native("ReadTrace") static function readTrace(): (go.Slice<go.Byte>);
    @:native("SetBlockProfileRate") static function setBlockProfileRate(rate: go.GoInt): Void;
    @:native("SetCPUProfileRate") static function setCPUProfileRate(hz: go.GoInt): Void;
    @:native("SetCgoTraceback") static function setCgoTraceback(version: go.GoInt, traceback: go.unsafe.Pointer, context: go.unsafe.Pointer, symbolizer: go.unsafe.Pointer): Void;
    @:native("SetDefaultGOMAXPROCS") static function setDefaultGOMAXPROCS(): Void;
    @:native("SetFinalizer") static function setFinalizer(obj: Dynamic, finalizer: Dynamic): Void;
    @:native("SetMutexProfileFraction") static function setMutexProfileFraction(rate: go.GoInt): (go.GoInt);
    @:native("Stack") static function stack(buf: go.Slice<go.Byte>, all: Bool): (go.GoInt);
    @:native("StartTrace") static function startTrace(): (go.Error);
    @:native("StopTrace") static function stopTrace(): Void;
    @:go.Tuple("n", "ok") @:native("ThreadCreateProfile") static function threadCreateProfile(p: go.Slice<go.runtime.StackRecord>): (go.Tuple<{ n: go.GoInt, ok: Bool }>);
    @:native("UnlockOSThread") static function unlockOSThread(): Void;
    @:native("Version") static function version(): (String);

}