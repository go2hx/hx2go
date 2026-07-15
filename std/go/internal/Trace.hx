package go.internal;

@:go.Type({ name: "trace", instanceName: "trace.trace", imports: ["internal/trace"] })
extern class Trace {

    @:native("BackgroundTask") static var BackgroundTask: go.internal.trace.TaskID;
    @:native("EventBad") static var EventBad: go.internal.trace.EventKind;
    @:native("EventExperimental") static var EventExperimental: go.internal.trace.EventKind;
    @:native("EventLabel") static var EventLabel: go.internal.trace.EventKind;
    @:native("EventLog") static var EventLog: go.internal.trace.EventKind;
    @:native("EventMetric") static var EventMetric: go.internal.trace.EventKind;
    @:native("EventRangeActive") static var EventRangeActive: go.internal.trace.EventKind;
    @:native("EventRangeBegin") static var EventRangeBegin: go.internal.trace.EventKind;
    @:native("EventRangeEnd") static var EventRangeEnd: go.internal.trace.EventKind;
    @:native("EventRegionBegin") static var EventRegionBegin: go.internal.trace.EventKind;
    @:native("EventRegionEnd") static var EventRegionEnd: go.internal.trace.EventKind;
    @:native("EventStackSample") static var EventStackSample: go.internal.trace.EventKind;
    @:native("EventStateTransition") static var EventStateTransition: go.internal.trace.EventKind;
    @:native("EventSync") static var EventSync: go.internal.trace.EventKind;
    @:native("EventTaskBegin") static var EventTaskBegin: go.internal.trace.EventKind;
    @:native("EventTaskEnd") static var EventTaskEnd: go.internal.trace.EventKind;
    @:native("GoNotExist") static var GoNotExist: go.internal.trace.GoState;
    @:native("GoRunnable") static var GoRunnable: go.internal.trace.GoState;
    @:native("GoRunning") static var GoRunning: go.internal.trace.GoState;
    @:native("GoSyscall") static var GoSyscall: go.internal.trace.GoState;
    @:native("GoUndetermined") static var GoUndetermined: go.internal.trace.GoState;
    @:native("GoWaiting") static var GoWaiting: go.internal.trace.GoState;
    @:native("NoGoroutine") static var NoGoroutine: go.internal.trace.GoID;
    @:native("NoProc") static var NoProc: go.internal.trace.ProcID;
    @:native("NoTask") static var NoTask: go.internal.trace.TaskID;
    @:native("NoThread") static var NoThread: go.internal.trace.ThreadID;
    @:native("ProcIdle") static var ProcIdle: go.internal.trace.ProcState;
    @:native("ProcNotExist") static var ProcNotExist: go.internal.trace.ProcState;
    @:native("ProcRunning") static var ProcRunning: go.internal.trace.ProcState;
    @:native("ProcUndetermined") static var ProcUndetermined: go.internal.trace.ProcState;
    @:native("ResourceGoroutine") static var ResourceGoroutine: go.internal.trace.ResourceKind;
    @:native("ResourceNone") static var ResourceNone: go.internal.trace.ResourceKind;
    @:native("ResourceProc") static var ResourceProc: go.internal.trace.ResourceKind;
    @:native("ResourceThread") static var ResourceThread: go.internal.trace.ResourceKind;
    @:native("UtilAssist") static var UtilAssist: go.internal.trace.UtilFlags;
    @:native("UtilBackground") static var UtilBackground: go.internal.trace.UtilFlags;
    @:native("UtilPerProc") static var UtilPerProc: go.internal.trace.UtilFlags;
    @:native("UtilSTW") static var UtilSTW: go.internal.trace.UtilFlags;
    @:native("UtilSweep") static var UtilSweep: go.internal.trace.UtilFlags;
    @:native("ValueBad") static var ValueBad: go.internal.trace.ValueKind;
    @:native("ValueString") static var ValueString: go.internal.trace.ValueKind;
    @:native("ValueUint64") static var ValueUint64: go.internal.trace.ValueKind;

    @:native("NoStack") static var NoStack: go.internal.trace.Stack;

    @:native("IsSystemGoroutine") static function isSystemGoroutine(entryFn: String): Bool;
    @:native("MakeEvent") static function makeEvent<T: go.internal.trace.EventDetails>(c: go.internal.trace.EventConfig<T>): go.Result<go.internal.trace.Event>;
    @:native("MakeGoStateTransition") static function makeGoStateTransition(id: go.internal.trace.GoID, _from: go.internal.trace.GoState, _to: go.internal.trace.GoState): go.internal.trace.StateTransition;
    @:native("MakeProcStateTransition") static function makeProcStateTransition(id: go.internal.trace.ProcID, _from: go.internal.trace.ProcState, _to: go.internal.trace.ProcState): go.internal.trace.StateTransition;
    @:native("MakeResourceID") static function makeResourceID<T: go.interface{internal.trace.GoID | internal.trace.ProcID | internal.trace.ThreadID}>(id: T): go.internal.trace.ResourceID;
    @:native("MakeStack") static function makeStack(frames: go.Slice<go.internal.trace.StackFrame>): go.internal.trace.Stack;
    @:native("MutatorUtilizationV2") static function mutatorUtilizationV2(events: go.Slice<go.internal.trace.Event>, flags: go.internal.trace.UtilFlags): go.Slice<go.Slice<go.internal.trace.MutatorUtil>>;
    @:native("NewMMUCurve") static function newMMUCurve(utils: go.Slice<go.Slice<go.internal.trace.MutatorUtil>>): go.Pointer<go.internal.trace.MMUCurve>;
    @:native("NewReader") static function newReader(r: go.io.Reader): go.Result<go.Pointer<go.internal.trace.Reader>>;
    @:native("NewSummarizer") static function newSummarizer(): go.Pointer<go.internal.trace.Summarizer>;
    @:native("RelatedGoroutinesV2") static function relatedGoroutinesV2(events: go.Slice<go.internal.trace.Event>, goid: go.internal.trace.GoID): go.Map<go.internal.trace.GoID, Dynamic>;
    @:native("StringValue") static function stringValue(s: String): go.internal.trace.Value;
    @:native("Uint64Value") static function uint64Value(x: go.UInt64): go.internal.trace.Value;

}