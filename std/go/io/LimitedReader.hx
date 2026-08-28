package go.io;

/**
    A LimitedReader reads from R but limits the amount of
    data returned to just N bytes. Each call to Read
    updates N to reflect the new amount remaining.
    Read returns EOF when N <= 0 or when the underlying R returns EOF.
**/
@:structInit
@:go.Type({ name: "LimitedReader", instanceName: "io.LimitedReader", imports: ["io"] })
extern class LimitedReader {

    @:native("R") var R: go.io.Reader;
    @:native("N") var N: go.Int64;

    function new(R: go.io.Reader=null, N: go.Int64=0);

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}