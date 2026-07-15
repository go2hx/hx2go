package go.io.fs;

@:go.Type({ name: "FileInfo", instanceName: "fs.FileInfo", imports: ["io/fs"] })
extern typedef FileInfo = {

    @:native("IsDir") function isDir(): Bool;
    @:native("ModTime") function modTime(): go.time.Time;
    @:native("Mode") function mode(): go.io.fs.FileMode;
    @:native("Name") function name(): String;
    @:native("Size") function size(): go.Int64;
    @:native("Sys") function sys(): Dynamic;

}