package go.io.fs;

@:go.Type({ name: "GlobFS", instanceName: "fs.GlobFS", imports: ["io/fs"] })
extern typedef GlobFS = {

    @:native("Glob") function glob(pattern: String): (go.Result<go.Slice<String>>);
    @:native("Open") function open(name: String): (go.Result<go.io.fs.File>);

}