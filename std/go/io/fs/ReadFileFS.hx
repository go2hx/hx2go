package go.io.fs;

@:go.Type({ name: "ReadFileFS", instanceName: "fs.ReadFileFS", imports: ["io/fs"] })
extern typedef ReadFileFS = {

    @:native("Open") function open(name: String): go.Result<go.io.fs.File>;
    @:native("ReadFile") function readFile(name: String): go.Result<go.Slice<go.Byte>>;

}