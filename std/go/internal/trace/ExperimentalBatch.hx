package go.internal.trace;

@:structInit
@:go.Type({ name: "ExperimentalBatch", instanceName: "trace.ExperimentalBatch", imports: ["internal/trace"] })
extern class ExperimentalBatch {

    @:native("Thread") var thread: go.internal.trace.ThreadID;
    @:native("Data") var data: go.Slice<go.Byte>;

function new(thread: go.internal.trace.ThreadID, data: go.Slice<go.Byte>);

}