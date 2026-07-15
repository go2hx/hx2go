package go.internal.trace.internal;

@:go.Type({ name: "tracev1", instanceName: "tracev1.tracev1", imports: ["internal/trace/internal/tracev1"] })
extern class Tracev1 {

    @:native("EvBatch") static var EvBatch: go.internal.trace.internal.tracev1.EventType;
    @:native("EvCPUSample") static var EvCPUSample: go.internal.trace.internal.tracev1.EventType;
    @:native("EvCount") static var EvCount: go.internal.trace.internal.tracev1.EventType;
    @:native("EvFrequency") static var EvFrequency: go.internal.trace.internal.tracev1.EventType;
    @:native("EvFutileWakeup") static var EvFutileWakeup: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGCDone") static var EvGCDone: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGCMarkAssistDone") static var EvGCMarkAssistDone: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGCMarkAssistStart") static var EvGCMarkAssistStart: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGCStart") static var EvGCStart: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGCSweepDone") static var EvGCSweepDone: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGCSweepStart") static var EvGCSweepStart: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGoBlock") static var EvGoBlock: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGoBlockCond") static var EvGoBlockCond: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGoBlockGC") static var EvGoBlockGC: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGoBlockNet") static var EvGoBlockNet: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGoBlockRecv") static var EvGoBlockRecv: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGoBlockSelect") static var EvGoBlockSelect: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGoBlockSend") static var EvGoBlockSend: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGoBlockSync") static var EvGoBlockSync: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGoCreate") static var EvGoCreate: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGoEnd") static var EvGoEnd: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGoInSyscall") static var EvGoInSyscall: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGoPreempt") static var EvGoPreempt: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGoSched") static var EvGoSched: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGoSleep") static var EvGoSleep: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGoStart") static var EvGoStart: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGoStartLabel") static var EvGoStartLabel: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGoStartLocal") static var EvGoStartLocal: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGoStop") static var EvGoStop: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGoSysBlock") static var EvGoSysBlock: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGoSysCall") static var EvGoSysCall: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGoSysExit") static var EvGoSysExit: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGoSysExitLocal") static var EvGoSysExitLocal: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGoUnblock") static var EvGoUnblock: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGoUnblockLocal") static var EvGoUnblockLocal: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGoWaiting") static var EvGoWaiting: go.internal.trace.internal.tracev1.EventType;
    @:native("EvGomaxprocs") static var EvGomaxprocs: go.internal.trace.internal.tracev1.EventType;
    @:native("EvHeapAlloc") static var EvHeapAlloc: go.internal.trace.internal.tracev1.EventType;
    @:native("EvHeapGoal") static var EvHeapGoal: go.internal.trace.internal.tracev1.EventType;
    @:native("EvNone") static var EvNone: go.internal.trace.internal.tracev1.EventType;
    @:native("EvProcStart") static var EvProcStart: go.internal.trace.internal.tracev1.EventType;
    @:native("EvProcStop") static var EvProcStop: go.internal.trace.internal.tracev1.EventType;
    @:native("EvSTWDone") static var EvSTWDone: go.internal.trace.internal.tracev1.EventType;
    @:native("EvSTWStart") static var EvSTWStart: go.internal.trace.internal.tracev1.EventType;
    @:native("EvStack") static var EvStack: go.internal.trace.internal.tracev1.EventType;
    @:native("EvString") static var EvString: go.internal.trace.internal.tracev1.EventType;
    @:native("EvTimerGoroutine") static var EvTimerGoroutine: go.internal.trace.internal.tracev1.EventType;
    @:native("EvUserLog") static var EvUserLog: go.internal.trace.internal.tracev1.EventType;
    @:native("EvUserRegion") static var EvUserRegion: go.internal.trace.internal.tracev1.EventType;
    @:native("EvUserTaskCreate") static var EvUserTaskCreate: go.internal.trace.internal.tracev1.EventType;
    @:native("EvUserTaskEnd") static var EvUserTaskEnd: go.internal.trace.internal.tracev1.EventType;
    @:native("FakeP") static var FakeP: go.GoInt;
    @:native("GCP") static var GCP: go.GoInt;
    @:native("NetpollP") static var NetpollP: go.GoInt;
    @:native("NumSTWReasons") static var NumSTWReasons: go.GoInt;
    @:native("ProfileP") static var ProfileP: go.GoInt;
    @:native("STWAllGoroutinesStackTrace") static var STWAllGoroutinesStackTrace: go.internal.trace.internal.tracev1.STWReason;
    @:native("STWAllThreadsSyscall") static var STWAllThreadsSyscall: go.internal.trace.internal.tracev1.STWReason;
    @:native("STWCountPagesInUse") static var STWCountPagesInUse: go.internal.trace.internal.tracev1.STWReason;
    @:native("STWGCMarkTermination") static var STWGCMarkTermination: go.internal.trace.internal.tracev1.STWReason;
    @:native("STWGCSweepTermination") static var STWGCSweepTermination: go.internal.trace.internal.tracev1.STWReason;
    @:native("STWGOMAXPROCS") static var STWGOMAXPROCS: go.internal.trace.internal.tracev1.STWReason;
    @:native("STWGoroutineProfile") static var STWGoroutineProfile: go.internal.trace.internal.tracev1.STWReason;
    @:native("STWGoroutineProfileCleanup") static var STWGoroutineProfileCleanup: go.internal.trace.internal.tracev1.STWReason;
    @:native("STWPageCachePagesLeaked") static var STWPageCachePagesLeaked: go.internal.trace.internal.tracev1.STWReason;
    @:native("STWReadMemStats") static var STWReadMemStats: go.internal.trace.internal.tracev1.STWReason;
    @:native("STWReadMemStatsSlow") static var STWReadMemStatsSlow: go.internal.trace.internal.tracev1.STWReason;
    @:native("STWReadMetricsSlow") static var STWReadMetricsSlow: go.internal.trace.internal.tracev1.STWReason;
    @:native("STWResetDebugLog") static var STWResetDebugLog: go.internal.trace.internal.tracev1.STWReason;
    @:native("STWStartTrace") static var STWStartTrace: go.internal.trace.internal.tracev1.STWReason;
    @:native("STWStopTrace") static var STWStopTrace: go.internal.trace.internal.tracev1.STWReason;
    @:native("STWUnknown") static var STWUnknown: go.internal.trace.internal.tracev1.STWReason;
    @:native("STWWriteHeapDump") static var STWWriteHeapDump: go.internal.trace.internal.tracev1.STWReason;
    @:native("SyscallP") static var SyscallP: go.GoInt;
    @:native("TimerP") static var TimerP: go.GoInt;

    @:native("EventDescriptions") static var EventDescriptions: go.GoArray<Dynamic, 256>;

    @:native("Parse") static function parse(r: go.io.Reader, vers: go.internal.trace.version.Version): go.Result<go.internal.trace.internal.tracev1.Trace>;

}