package go.runtime;

/**
    A StackRecord describes a single execution stack.
**/
@:structInit
@:go.Type({ name: "StackRecord", instanceName: "runtime.StackRecord", imports: ["runtime"] })
extern class StackRecord {

    @:native("Stack0") var stack0: go.GoArray<go.UIntPtr, 32>;

    function new(stack0: go.GoArray<go.UIntPtr, 32>);

    /**
        Stack returns the stack trace associated with the record,
        a prefix of r.Stack0.
    **/
    @:native("Stack") function stack(): (go.Slice<go.UIntPtr>);

}