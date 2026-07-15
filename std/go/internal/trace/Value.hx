package go.internal.trace;

@:structInit
@:go.Type({ name: "Value", instanceName: "trace.Value", imports: ["internal/trace"] })
extern class Value {

    @:native("Kind") function kind(): go.internal.trace.ValueKind;
    @:native("String") function string(): String;
    @:native("Uint64") function uint64(): go.UInt64;

}