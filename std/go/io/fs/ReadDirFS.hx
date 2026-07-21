package go.io.fs;

@:go.Type({ name: "ReadDirFS", instanceName: "fs.ReadDirFS", imports: ["io/fs"] })
extern typedef ReadDirFS = {

    @:native("Open") function open(name: String): (go.Result<go.io.fs.File>);
    @:native("ReadDir") function readDir(name: String): (go.Result<go.Slice<go.io.fs.DirEntry>>);

}