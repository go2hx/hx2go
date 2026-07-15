package go.internal.trace.traceviewer;

@:go.Type({ name: "format", instanceName: "format.format", imports: ["internal/trace/traceviewer/format"] })
extern class Format {

    @:native("ProcsSection") static var ProcsSection: go.GoInt;
    @:native("StatsSection") static var StatsSection: go.GoInt;
    @:native("TasksSection") static var TasksSection: go.GoInt;

}