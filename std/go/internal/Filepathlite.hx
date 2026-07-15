package go.internal;

@:go.Type({ name: "filepathlite", instanceName: "filepathlite.filepathlite", imports: ["internal/filepathlite"] })
extern class Filepathlite {

    @:native("ListSeparator") static var ListSeparator: go.Rune;
    @:native("Separator") static var Separator: go.Rune;

    @:native("Base") static function base(path: String): String;
    @:native("Clean") static function clean(path: String): String;
    @:native("Dir") static function dir(path: String): String;
    @:native("Ext") static function ext(path: String): String;
    @:native("FromSlash") static function fromSlash(path: String): String;
    @:native("IsAbs") static function isAbs(path: String): Bool;
    @:native("IsLocal") static function isLocal(path: String): Bool;
    @:native("IsPathSeparator") static function isPathSeparator(c: go.UInt8): Bool;
    @:native("Localize") static function localize(path: String): go.Result<String>;
    @:go.Tuple("dir", "file") @:native("Split") static function split(path: String): go.Tuple<{ dir: String, file: String }>;
    @:native("ToSlash") static function toSlash(path: String): String;
    @:native("VolumeName") static function volumeName(path: String): String;
    @:native("VolumeNameLen") static function volumeNameLen(path: String): go.GoInt;

}