package go.os;

@:structInit
@:go.Type({ name: "fileStat", instanceName: "os.fileStat", imports: ["os"] })
extern class FileStat {

    @:native("IsDir") function isDir(): (Bool);
    @:native("ModTime") function modTime(): (go.time.Time);
    @:native("Mode") function mode(): (go.os.FileMode);
    @:native("Name") function name(): (String);
    @:native("Size") function size(): (go.Int64);
    @:native("Sys") function sys(): (Dynamic);

}