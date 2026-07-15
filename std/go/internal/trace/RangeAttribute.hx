package go.internal.trace;

@:structInit
@:go.Type({ name: "RangeAttribute", instanceName: "trace.RangeAttribute", imports: ["internal/trace"] })
extern class RangeAttribute {

    @:native("Name") var name: String;
    @:native("Value") var value: go.internal.trace.Value;

function new(name: String, value: go.internal.trace.Value);

}