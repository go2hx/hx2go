package go.internal.trace;

@:go.Type({ name: "traceviewer", instanceName: "traceviewer.traceviewer", imports: ["internal/trace/traceviewer"] })
extern class Traceviewer {

    @:native("CommonStyle") static var CommonStyle: String;
    @:native("FakeP") static var FakeP: go.GoInt;
    @:native("GCP") static var GCP: go.GoInt;
    @:native("GDead") static var GDead: go.internal.trace.traceviewer.GState;
    @:native("GRunnable") static var GRunnable: go.internal.trace.traceviewer.GState;
    @:native("GRunning") static var GRunning: go.internal.trace.traceviewer.GState;
    @:native("GWaiting") static var GWaiting: go.internal.trace.traceviewer.GState;
    @:native("GWaitingGC") static var GWaitingGC: go.internal.trace.traceviewer.GState;
    @:native("ModeGoroutineOriented") static var ModeGoroutineOriented: go.internal.trace.traceviewer.Mode;
    @:native("ModeTaskOriented") static var ModeTaskOriented: go.internal.trace.traceviewer.Mode;
    @:native("ModeThreadOriented") static var ModeThreadOriented: go.internal.trace.traceviewer.Mode;
    @:native("NetpollP") static var NetpollP: go.GoInt;
    @:native("ProfileP") static var ProfileP: go.GoInt;
    @:native("SyscallP") static var SyscallP: go.GoInt;
    @:native("ThreadStateInSyscall") static var ThreadStateInSyscall: go.internal.trace.traceviewer.ThreadState;
    @:native("ThreadStateInSyscallRuntime") static var ThreadStateInSyscallRuntime: go.internal.trace.traceviewer.ThreadState;
    @:native("ThreadStateRunning") static var ThreadStateRunning: go.internal.trace.traceviewer.ThreadState;
    @:native("TimerP") static var TimerP: go.GoInt;
    @:native("ViewProc") static var ViewProc: go.internal.trace.traceviewer.ViewType;
    @:native("ViewThread") static var ViewThread: go.internal.trace.traceviewer.ViewType;

    @:native("BuildProfile") static function buildProfile(prof: go.Slice<go.internal.trace.traceviewer.ProfileRecord>): go.Pointer<go.internal.profile.Profile>;
    @:native("MMUHandlerFunc") static function mMUHandlerFunc(ranges: go.Slice<go.internal.trace.traceviewer.Range>, f: go.internal.trace.traceviewer.MutatorUtilFunc): go.net.http.HandlerFunc;
    @:native("MainHandler") static function mainHandler(views: go.Slice<go.internal.trace.traceviewer.View>): go.net.http.Handler;
    @:native("NewEmitter") static function newEmitter(c: go.internal.trace.traceviewer.TraceConsumer, rangeStart: go.time.Duration, rangeEnd: go.time.Duration): go.Pointer<go.internal.trace.traceviewer.Emitter>;
    @:native("SVGProfileHandlerFunc") static function sVGProfileHandlerFunc(f: go.internal.trace.traceviewer.ProfileFunc): go.net.http.HandlerFunc;
    @:go.Tuple("p0", "p1") @:native("SplittingTraceConsumer") static function splittingTraceConsumer(max: go.GoInt): go.Tuple<{ p0: go.Pointer<go.internal.trace.traceviewer.splitter>, p1: go.internal.trace.traceviewer.TraceConsumer }>;
    @:native("StaticHandler") static function staticHandler(): go.net.http.Handler;
    @:native("TraceHandler") static function traceHandler(): go.net.http.Handler;
    @:native("ViewerDataTraceConsumer") static function viewerDataTraceConsumer(w: go.io.Writer, startIdx: go.Int64, endIdx: go.Int64): go.internal.trace.traceviewer.TraceConsumer;
    @:native("WalkStackFrames") static function walkStackFrames(allFrames: go.Map<String, go.internal.trace.traceviewer.format.Frame>, id: go.GoInt, fn: (id: go.GoInt) -> Void): Void;

}