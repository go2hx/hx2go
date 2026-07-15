package go.internal.trace.internal.tracev1;

@:structInit
@:go.Type({ name: "Events", instanceName: "tracev1.Events", imports: ["internal/trace/internal/tracev1"] })
extern class Events {

    @:native("All") function all(): go.func(yield func(ev *internal.trace.internal.tracev1.Event) bool);
    @:native("Len") function len(): go.GoInt;
    @:native("Less") function less(i: go.GoInt, j: go.GoInt): Bool;
    @:go.Tuple("p0", "p1") @:native("Peek") function peek(): go.Tuple<{ p0: go.Pointer<go.internal.trace.internal.tracev1.Event>, p1: Bool }>;
    @:go.Tuple("p0", "p1") @:native("Pop") function pop(): go.Tuple<{ p0: go.Pointer<go.internal.trace.internal.tracev1.Event>, p1: Bool }>;
    @:native("Ptr") function ptr(i: go.GoInt): go.Pointer<go.internal.trace.internal.tracev1.Event>;
    @:native("Swap") function swap(i: go.GoInt, j: go.GoInt): Void;

}