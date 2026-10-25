package go.os;

@:structInit
@:go.Type({ name: "dirEntry", instanceName: "os.dirEntry", imports: ["os"] })
extern class DirEntry_ {

    @:native("Info") function info(): (go.Result<go.os.FileInfo>);
    @:native("IsDir") function isDir(): (Bool);
    @:native("Name") function name(): (String);
    @:native("String") function string(): (String);
    @:native("Type") function type(): (go.os.FileMode);

}