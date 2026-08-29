package go.io.fs;

/**
    A GlobFS is a file system with a Glob method.
**/
@:go.Type({ name: "GlobFS", instanceName: "fs.GlobFS", imports: ["io/fs"] })
extern typedef GlobFS = {

    @:native("Glob") function glob(pattern: String): (go.Result<go.Slice<String>>);
    @:native("Open") function open(name: String): (go.Result<go.io.fs.File>);

}