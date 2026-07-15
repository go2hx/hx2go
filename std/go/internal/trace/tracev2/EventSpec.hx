package go.internal.trace.tracev2;

@:structInit
@:go.Type({ name: "EventSpec", instanceName: "tracev2.EventSpec", imports: ["internal/trace/tracev2"] })
extern class EventSpec {

    @:native("Name") var name: String;
    @:native("Args") var args: go.Slice<String>;
    @:native("StringIDs") var stringIDs: go.Slice<go.GoInt>;
    @:native("StackIDs") var stackIDs: go.Slice<go.GoInt>;
    @:native("StartEv") var startEv: go.internal.trace.tracev2.EventType;
    @:native("IsTimedEvent") var isTimedEvent: Bool;
    @:native("HasData") var hasData: Bool;
    @:native("IsStack") var isStack: Bool;
    @:native("Experiment") var experiment: go.internal.trace.tracev2.Experiment;

function new(name: String, args: go.Slice<String>, stringIDs: go.Slice<go.GoInt>, stackIDs: go.Slice<go.GoInt>, startEv: go.internal.trace.tracev2.EventType, isTimedEvent: Bool, hasData: Bool, isStack: Bool, experiment: go.internal.trace.tracev2.Experiment);

}