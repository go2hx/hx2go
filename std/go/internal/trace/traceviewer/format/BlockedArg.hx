package go.internal.trace.traceviewer.format;

@:structInit
@:go.Type({ name: "BlockedArg", instanceName: "format.BlockedArg", imports: ["internal/trace/traceviewer/format"] })
extern class BlockedArg {

    @:native("Blocked") var blocked: String;

function new(blocked: String);

}