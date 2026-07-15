package go.io.fs;

@:go.Type({ name: "FS", instanceName: "fs.FS", imports: ["io/fs"] })
extern typedef FS = {

    @:native("Open") function open(name: String): go.Result<go.io.fs.File>;

}