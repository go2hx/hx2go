package go.io.fs;

@:structInit
@:go.Type({ name: "dirInfo", instanceName: "fs.dirInfo", imports: ["io/fs"] })
extern class DirInfo {

    @:native("Info") function info(): (go.Result<go.io.fs.FileInfo>);
    @:native("IsDir") function isDir(): (Bool);
    @:native("Name") function name(): (String);
    @:native("String") function string(): (String);
    @:native("Type") function type(): (go.io.fs.FileMode);

}