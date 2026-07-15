package go.internal.trace.internal.tracev1;

@:structInit
@:go.Type({ name: "Event", instanceName: "tracev1.Event", imports: ["internal/trace/internal/tracev1"] })
extern class Event {

    @:native("Ts") var ts: go.internal.trace.internal.tracev1.Timestamp;
    @:native("G") var G: go.UInt64;
    @:native("Args") var args: go.GoArray<go.UInt64, 4>;
    @:native("StkID") var stkID: go.UInt32;
    @:native("P") var P: go.Int32;
    @:native("Type") var type: go.internal.trace.internal.tracev1.EventType;

function new(ts: go.internal.trace.internal.tracev1.Timestamp, G: go.UInt64, args: go.GoArray<go.UInt64, 4>, stkID: go.UInt32, P: go.Int32, type: go.internal.trace.internal.tracev1.EventType);

    @:native("String") function string(): String;

}