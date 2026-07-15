package go.io.fs;

@:go.Type({ name: "StatFS", instanceName: "fs.StatFS", imports: ["io/fs"] })
extern typedef StatFS = {

    @:native("Open") function open(name: String): go.Result<go.io.fs.File>;
    @:native("Stat") function stat(name: String): go.Result<go.io.fs.FileInfo>;

}