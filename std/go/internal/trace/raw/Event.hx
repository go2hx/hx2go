package go.internal.trace.raw;

@:structInit
@:go.Type({ name: "Event", instanceName: "raw.Event", imports: ["internal/trace/raw"] })
extern class Event {

    @:native("Version") var version: go.internal.trace.version.Version;
    @:native("Ev") var ev: go.internal.trace.tracev2.EventType;
    @:native("Args") var args: go.Slice<go.UInt64>;
    @:native("Data") var data: go.Slice<go.Byte>;

function new(version: go.internal.trace.version.Version, ev: go.internal.trace.tracev2.EventType, args: go.Slice<go.UInt64>, data: go.Slice<go.Byte>);

    @:native("EncodedSize") function encodedSize(): go.GoInt;
    @:native("String") function string(): String;

}