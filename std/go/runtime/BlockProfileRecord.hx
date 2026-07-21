package go.runtime;

@:structInit
@:go.Type({ name: "BlockProfileRecord", instanceName: "runtime.BlockProfileRecord", imports: ["runtime"] })
extern class BlockProfileRecord {

    @:native("Count") var count: go.Int64;
    @:native("Cycles") var cycles: go.Int64;
    @:native("StackRecord") var stackRecord: go.runtime.StackRecord;
    @:native("Stack0") var stack0: go.GoArray<go.UIntPtr, 32>;

    function new(count: go.Int64, cycles: go.Int64, stackRecord: go.runtime.StackRecord);

    @:native("Stack") function stack(): (go.Slice<go.UIntPtr>);

}