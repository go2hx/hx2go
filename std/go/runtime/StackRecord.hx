package go.runtime;

@:structInit
@:go.Type({ name: "StackRecord", instanceName: "runtime.StackRecord", imports: ["runtime"] })
extern class StackRecord {

    @:native("Stack0") var stack0: go.GoArray<go.UIntPtr, 32>;

    function new(stack0: go.GoArray<go.UIntPtr, 32>);

    @:native("Stack") function stack(): (go.Slice<go.UIntPtr>);

}