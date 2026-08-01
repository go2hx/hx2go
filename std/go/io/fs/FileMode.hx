package go.io.fs;

@:go.Type({ name: "FileMode", instanceName: "fs.FileMode", imports: ["io/fs"] })
extern typedef FileMode = haxe.extern.EitherType<go.UInt32, {
    @:native("IsDir") function isDir(): (Bool);
    @:native("IsRegular") function isRegular(): (Bool);
    @:native("Perm") function perm(): (go.io.fs.FileMode);
    @:native("String") function string(): (String);
    @:native("Type") function type(): (go.io.fs.FileMode);

}>