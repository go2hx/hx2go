package go.runtime.trace;

@:structInit
@:go.Type({ name: "traceMultiplexer", instanceName: "trace.traceMultiplexer", imports: ["runtime/trace"] })
extern class TraceMultiplexer {

    @:native("Mutex") var mutex: go.sync.Mutex;

    function new(mutex: go.sync.Mutex);

    @:native("Lock") function lock(): Void;
    @:native("TryLock") function tryLock(): (Bool);
    @:native("Unlock") function unlock(): Void;

}