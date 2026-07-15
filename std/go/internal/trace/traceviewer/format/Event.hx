package go.internal.trace.traceviewer.format;

@:structInit
@:go.Type({ name: "Event", instanceName: "format.Event", imports: ["internal/trace/traceviewer/format"] })
extern class Event {

    @:native("Name") var name: String;
    @:native("Phase") var phase: String;
    @:native("Scope") var scope: String;
    @:native("Time") var time: Float;
    @:native("Dur") var dur: Float;
    @:native("PID") var PID: go.UInt64;
    @:native("TID") var TID: go.UInt64;
    @:native("ID") var ID: go.UInt64;
    @:native("BindPoint") var bindPoint: String;
    @:native("Stack") var stack: go.GoInt;
    @:native("EndStack") var endStack: go.GoInt;
    @:native("Arg") var arg: Dynamic;
    @:native("Cname") var cname: String;
    @:native("Category") var category: String;

function new(name: String, phase: String, scope: String, time: Float, dur: Float, PID: go.UInt64, TID: go.UInt64, ID: go.UInt64, bindPoint: String, stack: go.GoInt, endStack: go.GoInt, arg: Dynamic, cname: String, category: String);

}