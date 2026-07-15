package go.internal.trace.traceviewer.format;

@:structInit
@:go.Type({ name: "Frame", instanceName: "format.Frame", imports: ["internal/trace/traceviewer/format"] })
extern class Frame {

    @:native("Name") var name: String;
    @:native("Parent") var parent: go.GoInt;

function new(name: String, parent: go.GoInt);

}