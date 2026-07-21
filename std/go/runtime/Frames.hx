package go.runtime;

@:structInit
@:go.Type({ name: "Frames", instanceName: "runtime.Frames", imports: ["runtime"] })
extern class Frames {

    @:go.Tuple("frame", "more") @:native("Next") function next(): (go.Tuple<{ frame: go.runtime.Frame, more: Bool }>);

}