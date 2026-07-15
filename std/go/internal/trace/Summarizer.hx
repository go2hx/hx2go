package go.internal.trace;

@:structInit
@:go.Type({ name: "Summarizer", instanceName: "trace.Summarizer", imports: ["internal/trace"] })
extern class Summarizer {

    @:native("Event") function event(ev: go.Pointer<go.internal.trace.Event>): Void;
    @:native("Finalize") function finalize(): go.Pointer<go.internal.trace.Summary>;

}