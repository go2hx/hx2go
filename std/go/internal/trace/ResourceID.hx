package go.internal.trace;

@:structInit
@:go.Type({ name: "ResourceID", instanceName: "trace.ResourceID", imports: ["internal/trace"] })
extern class ResourceID {

    @:native("Kind") var kind: go.internal.trace.ResourceKind;

function new(kind: go.internal.trace.ResourceKind);

    @:native("Goroutine") function goroutine(): go.internal.trace.GoID;
    @:native("Proc") function proc(): go.internal.trace.ProcID;
    @:native("String") function string(): String;
    @:native("Thread") function thread(): go.internal.trace.ThreadID;

}