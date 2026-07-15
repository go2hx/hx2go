package go.internal.trace.internal.tracev1;

@:structInit
@:go.Type({ name: "Trace", instanceName: "tracev1.Trace", imports: ["internal/trace/internal/tracev1"] })
extern class Trace {

    @:native("Version") var version: go.internal.trace.version.Version;
    @:native("Events") var events: go.internal.trace.internal.tracev1.Events;
    @:native("Stacks") var stacks: go.Map<go.UInt32, go.Slice<go.UInt64>>;
    @:native("PCs") var pCs: go.Map<go.UInt64, go.internal.trace.internal.tracev1.Frame>;
    @:native("Strings") var strings: go.Map<go.UInt64, String>;
    @:native("InlineStrings") var inlineStrings: go.Slice<String>;

function new(version: go.internal.trace.version.Version, events: go.internal.trace.internal.tracev1.Events, stacks: go.Map<go.UInt32, go.Slice<go.UInt64>>, pCs: go.Map<go.UInt64, go.internal.trace.internal.tracev1.Frame>, strings: go.Map<go.UInt64, String>, inlineStrings: go.Slice<String>);

    @:native("STWReason") function sTWReason(kindID: go.UInt64): go.internal.trace.internal.tracev1.STWReason;

}