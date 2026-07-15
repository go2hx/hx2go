package go.internal.trace.traceviewer.format;

@:structInit
@:go.Type({ name: "SortIndexArg", instanceName: "format.SortIndexArg", imports: ["internal/trace/traceviewer/format"] })
extern class SortIndexArg {

    @:native("Index") var index: go.GoInt;

function new(index: go.GoInt);

}