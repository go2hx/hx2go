package go.internal.trace.traceviewer.format;

@:structInit
@:go.Type({ name: "NameArg", instanceName: "format.NameArg", imports: ["internal/trace/traceviewer/format"] })
extern class NameArg {

    @:native("Name") var name: String;

function new(name: String);

}