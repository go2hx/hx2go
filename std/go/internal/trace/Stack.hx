package go.internal.trace;

@:structInit
@:go.Type({ name: "Stack", instanceName: "trace.Stack", imports: ["internal/trace"] })
extern class Stack {

    @:native("Frames") function frames(): go.iter.Seq<go.internal.trace.StackFrame>;
    @:native("String") function string(): String;

}