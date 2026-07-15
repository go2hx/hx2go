package go.internal.trace;

@:structInit
@:go.Type({ name: "StackFrame", instanceName: "trace.StackFrame", imports: ["internal/trace"] })
extern class StackFrame {

    @:native("PC") var PC: go.UInt64;
    @:native("Func") var func: String;
    @:native("File") var file: String;
    @:native("Line") var line: go.UInt64;

function new(PC: go.UInt64, func: String, file: String, line: go.UInt64);

}