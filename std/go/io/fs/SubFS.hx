package go.io.fs;

/**
    A SubFS is a file system with a Sub method.
**/
@:go.Type({ name: "SubFS", instanceName: "fs.SubFS", imports: ["io/fs"] })
extern typedef SubFS = {

    @:native("Open") function open(name: String): (go.Result<go.io.fs.File>);
    @:native("Sub") function sub(dir: String): (go.Result<go.io.fs.FS>);

}