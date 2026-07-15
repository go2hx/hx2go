package go.path;

@:go.Type({ name: "filepath", instanceName: "filepath.filepath", imports: ["path/filepath"] })
extern class Filepath {

    @:native("ListSeparator") static var ListSeparator: go.Rune;
    @:native("Separator") static var Separator: go.Rune;

    @:native("Abs") static function abs(path: String): go.Result<String>;
    @:native("Base") static function base(path: String): String;
    @:native("Clean") static function clean(path: String): String;
    @:native("Dir") static function dir(path: String): String;
    @:native("EvalSymlinks") static function evalSymlinks(path: String): go.Result<String>;
    @:native("Ext") static function ext(path: String): String;
    @:native("FromSlash") static function fromSlash(path: String): String;
    @:native("Glob") static function glob(pattern: String): go.Result<go.Slice<String>>;
    @:native("HasPrefix") static function hasPrefix(p: String, prefix: String): Bool;
    @:native("IsAbs") static function isAbs(path: String): Bool;
    @:native("IsLocal") static function isLocal(path: String): Bool;
    @:native("Join") static function join(elem: haxe.Rest<String>): String;
    @:native("Localize") static function localize(path: String): go.Result<String>;
    @:native("Match") static function match(pattern: String, name: String): go.Result<Bool>;
    @:native("Rel") static function rel(basePath: String, targPath: String): go.Result<String>;
    @:go.Tuple("dir", "file") @:native("Split") static function split(path: String): go.Tuple<{ dir: String, file: String }>;
    @:native("SplitList") static function splitList(path: String): go.Slice<String>;
    @:native("ToSlash") static function toSlash(path: String): String;
    @:native("VolumeName") static function volumeName(path: String): String;
    @:native("Walk") static function walk(root: String, fn: go.path.filepath.WalkFunc): go.Error;
    @:native("WalkDir") static function walkDir(root: String, fn: go.io.fs.WalkDirFunc): go.Error;

}