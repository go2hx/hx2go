package go.os.exec;

@:structInit
@:go.Type({ name: "prefixSuffixSaver", instanceName: "exec.prefixSuffixSaver", imports: ["os/exec"] })
extern class PrefixSuffixSaver {

    @:native("N") var N: go.GoInt;

    function new(N: go.GoInt);

    @:native("Bytes") function bytes(): (go.Slice<go.Byte>);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}