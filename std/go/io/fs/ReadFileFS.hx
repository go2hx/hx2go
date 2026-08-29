package go.io.fs;

/**
    ReadFileFS is the interface implemented by a file system
    that provides an optimized implementation of [ReadFile].
**/
@:go.Type({ name: "ReadFileFS", instanceName: "fs.ReadFileFS", imports: ["io/fs"] })
extern typedef ReadFileFS = {

    @:native("Open") function open(name: String): (go.Result<go.io.fs.File>);
    @:native("ReadFile") function readFile(name: String): (go.Result<go.Slice<go.Byte>>);

}