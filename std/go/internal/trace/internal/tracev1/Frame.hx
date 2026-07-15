package go.internal.trace.internal.tracev1;

@:structInit
@:go.Type({ name: "Frame", instanceName: "tracev1.Frame", imports: ["internal/trace/internal/tracev1"] })
extern class Frame {

    @:native("PC") var PC: go.UInt64;
    @:native("Fn") var fn: go.UInt64;
    @:native("File") var file: go.UInt64;
    @:native("Line") var line: go.GoInt;

function new(PC: go.UInt64, fn: go.UInt64, file: go.UInt64, line: go.GoInt);

}