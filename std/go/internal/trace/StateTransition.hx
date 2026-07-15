package go.internal.trace;

@:structInit
@:go.Type({ name: "StateTransition", instanceName: "trace.StateTransition", imports: ["internal/trace"] })
extern class StateTransition {

    @:native("Resource") var resource: go.internal.trace.ResourceID;
    @:native("Reason") var reason: String;
    @:native("Stack") var stack: go.internal.trace.Stack;

function new(resource: go.internal.trace.ResourceID, reason: String, stack: go.internal.trace.Stack);

    @:go.Tuple("from", "to") @:native("Goroutine") function goroutine(): go.Tuple<{ _from: go.internal.trace.GoState, _to: go.internal.trace.GoState }>;
    @:go.Tuple("from", "to") @:native("Proc") function proc(): go.Tuple<{ _from: go.internal.trace.ProcState, _to: go.internal.trace.ProcState }>;

}