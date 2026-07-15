package go.internal.trace.internal.testgen;

@:structInit
@:go.Type({ name: "Batch", instanceName: "testgen.Batch", imports: ["internal/trace/internal/testgen"] })
extern class Batch {

    @:native("Event") function event(name: String, args: haxe.Rest<Dynamic>): Void;
    @:native("RawEvent") function rawEvent(typ: go.internal.trace.tracev2.EventType, data: go.Slice<go.Byte>, args: haxe.Rest<go.UInt64>): Void;

}