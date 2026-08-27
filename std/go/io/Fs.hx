package go.io;

@:go.Type({ name: "fs", instanceName: "fs.fs", imports: ["io/fs"] })
extern class Fs {

    @:native("ModeAppend") static var modeAppend: go.io.fs.FileMode;
    @:native("ModeCharDevice") static var modeCharDevice: go.io.fs.FileMode;
    @:native("ModeDevice") static var modeDevice: go.io.fs.FileMode;
    @:native("ModeDir") static var modeDir: go.io.fs.FileMode;
    @:native("ModeExclusive") static var modeExclusive: go.io.fs.FileMode;
    @:native("ModeIrregular") static var modeIrregular: go.io.fs.FileMode;
    @:native("ModeNamedPipe") static var modeNamedPipe: go.io.fs.FileMode;
    @:native("ModePerm") static var modePerm: go.io.fs.FileMode;
    @:native("ModeSetgid") static var modeSetgid: go.io.fs.FileMode;
    @:native("ModeSetuid") static var modeSetuid: go.io.fs.FileMode;
    @:native("ModeSocket") static var modeSocket: go.io.fs.FileMode;
    @:native("ModeSticky") static var modeSticky: go.io.fs.FileMode;
    @:native("ModeSymlink") static var modeSymlink: go.io.fs.FileMode;
    @:native("ModeTemporary") static var modeTemporary: go.io.fs.FileMode;
    @:native("ModeType") static var modeType: go.io.fs.FileMode;

    @:native("FileInfoToDirEntry") static function fileInfoToDirEntry(info: go.io.fs.FileInfo): (go.io.fs.DirEntry);
    @:native("FormatDirEntry") static function formatDirEntry(dir: go.io.fs.DirEntry): (String);
    @:native("FormatFileInfo") static function formatFileInfo(info: go.io.fs.FileInfo): (String);
    @:native("Glob") static function glob(fsys: go.io.fs.FS, pattern: String): (go.Result<go.Slice<String>>);
    @:native("Lstat") static function lstat(fsys: go.io.fs.FS, name: String): (go.Result<go.io.fs.FileInfo>);
    @:native("ReadDir") static function readDir(fsys: go.io.fs.FS, name: String): (go.Result<go.Slice<go.io.fs.DirEntry>>);
    @:native("ReadFile") static function readFile(fsys: go.io.fs.FS, name: String): (go.Result<go.Slice<go.Byte>>);
    @:native("ReadLink") static function readLink(fsys: go.io.fs.FS, name: String): (go.Result<String>);
    @:native("Stat") static function stat(fsys: go.io.fs.FS, name: String): (go.Result<go.io.fs.FileInfo>);
    @:native("Sub") static function sub(fsys: go.io.fs.FS, dir: String): (go.Result<go.io.fs.FS>);
    @:native("ValidPath") static function validPath(name: String): (Bool);
    @:native("WalkDir") static function walkDir(fsys: go.io.fs.FS, root: String, fn: go.io.fs.WalkDirFunc): (go.Error);

}