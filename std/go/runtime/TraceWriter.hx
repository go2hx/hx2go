package go.runtime;

@:structInit
@:go.Type({ name: "traceWriter", instanceName: "runtime.traceWriter", imports: ["runtime"] })
extern class TraceWriter {

    @:native("GCActive") function gCActive(): Void;
    @:native("GCDone") function gCDone(): Void;
    @:native("GCMarkAssistDone") function gCMarkAssistDone(): Void;
    @:native("GCMarkAssistStart") function gCMarkAssistStart(): Void;
    @:native("GCStart") function gCStart(): Void;
    @:native("GCSweepDone") function gCSweepDone(): Void;
    @:native("GCSweepSpan") function gCSweepSpan(bytesSwept: go.UIntPtr): Void;
    @:native("GCSweepStart") function gCSweepStart(): Void;
    @:native("GoCreate") function goCreate(newg: go.Pointer<go.runtime.G>, pc: go.UIntPtr, blocked: Bool): Void;
    @:native("GoCreateSyscall") function goCreateSyscall(gp: go.Pointer<go.runtime.G>): Void;
    @:native("GoDestroySyscall") function goDestroySyscall(): Void;
    @:native("GoEnd") function goEnd(): Void;
    @:native("GoPark") function goPark(reason: go.runtime.TraceBlockReason, skip: go.GoInt): Void;
    @:native("GoPreempt") function goPreempt(): Void;
    @:native("GoSched") function goSched(): Void;
    @:native("GoStart") function goStart(): Void;
    @:native("GoStop") function goStop(reason: go.runtime.TraceGoStopReason): Void;
    @:native("GoSwitch") function goSwitch(nextg: go.Pointer<go.runtime.G>, destroy: Bool): Void;
    @:native("GoSysCall") function goSysCall(): Void;
    @:native("GoSysExit") function goSysExit(lostP: Bool): Void;
    @:native("GoUnpark") function goUnpark(gp: go.Pointer<go.runtime.G>, skip: go.GoInt): Void;
    @:native("Gomaxprocs") function gomaxprocs(procs: go.Int32): Void;
    @:native("GoroutineStackAlloc") function goroutineStackAlloc(base: go.UIntPtr, size: go.UIntPtr): Void;
    @:native("GoroutineStackExists") function goroutineStackExists(base: go.UIntPtr, size: go.UIntPtr): Void;
    @:native("GoroutineStackFree") function goroutineStackFree(base: go.UIntPtr): Void;
    @:native("HeapAlloc") function heapAlloc(live: go.UInt64): Void;
    @:native("HeapGoal") function heapGoal(): Void;
    @:native("HeapObjectAlloc") function heapObjectAlloc(addr: go.UIntPtr, typ: go.Pointer<Dynamic>): Void;
    @:native("HeapObjectExists") function heapObjectExists(addr: go.UIntPtr, typ: go.Pointer<Dynamic>): Void;
    @:native("HeapObjectFree") function heapObjectFree(addr: go.UIntPtr): Void;
    @:native("ProcStart") function procStart(): Void;
    @:native("ProcSteal") function procSteal(pp: go.Pointer<go.runtime.P>): Void;
    @:native("ProcStop") function procStop(pp: go.Pointer<go.runtime.P>): Void;
    @:native("STWDone") function sTWDone(): Void;
    @:native("STWStart") function sTWStart(reason: go.runtime.StwReason): Void;
    @:native("SpanAlloc") function spanAlloc(s: go.Pointer<go.runtime.Mspan>): Void;
    @:native("SpanExists") function spanExists(s: go.Pointer<go.runtime.Mspan>): Void;
    @:native("SpanFree") function spanFree(s: go.Pointer<go.runtime.Mspan>): Void;

}