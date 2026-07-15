package go.internal.trace.internal.testgen;

@:structInit
@:go.Type({ name: "Generation", instanceName: "testgen.Generation", imports: ["internal/trace/internal/testgen"] })
extern class Generation {

    @:native("Batch") function batch(thread: go.internal.trace.ThreadID, time: go.internal.trace.internal.testgen.Time): go.Pointer<go.internal.trace.internal.testgen.Batch>;
    @:native("Stack") function stack(stk: go.Slice<go.internal.trace.StackFrame>): go.UInt64;
    @:native("String") function string(s: String): go.UInt64;
    @:native("Sync") function sync(freq: go.UInt64, time: go.internal.trace.internal.testgen.Time, mono: go.UInt64, wall: go.time.Time): Void;

}