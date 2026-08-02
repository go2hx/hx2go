package go.archive.tar;

@:structInit
@:go.Type({ name: "headerFileInfo", instanceName: "tar.headerFileInfo", imports: ["archive/tar"] })
extern class HeaderFileInfo {

    @:native("IsDir") function isDir(): (Bool);
    @:native("ModTime") function modTime(): (go.time.Time);
    @:native("Mode") function mode(): (go.io.fs.FileMode);
    @:native("Name") function name(): (String);
    @:native("Size") function size(): (go.Int64);
    @:native("String") function string(): (String);
    @:native("Sys") function sys(): (Dynamic);

}