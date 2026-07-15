package go.archive.tar;

@:go.Type({ name: "FileInfoNames", instanceName: "tar.FileInfoNames", imports: ["archive/tar"] })
extern typedef FileInfoNames = {

    @:native("Gname") function gname(): go.Result<String>;
    @:native("IsDir") function isDir(): Bool;
    @:native("ModTime") function modTime(): go.time.Time;
    @:native("Mode") function mode(): go.io.fs.FileMode;
    @:native("Name") function name(): String;
    @:native("Size") function size(): go.Int64;
    @:native("Sys") function sys(): Dynamic;
    @:native("Uname") function uname(): go.Result<String>;

}