package go.internal.trace.internal.testgen;

@:structInit
@:go.Type({ name: "Trace", instanceName: "testgen.Trace", imports: ["internal/trace/internal/testgen"] })
extern class Trace {

    @:native("DisableTimestamps") function disableTimestamps(): Void;
    @:native("ExpectFailure") function expectFailure(pattern: String): Void;
    @:native("ExpectSuccess") function expectSuccess(): Void;
    @:native("Generate") function generate(): go.Slice<go.Byte>;
    @:native("Generation") function generation(gen: go.UInt64): go.Pointer<go.internal.trace.internal.testgen.Generation>;
    @:native("RawEvent") function rawEvent(typ: go.internal.trace.tracev2.EventType, data: go.Slice<go.Byte>, args: haxe.Rest<go.UInt64>): Void;

}