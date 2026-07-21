package go.io;

@:go.Type({ name: "fs", instanceName: "fs.fs", imports: ["io/fs"] })
extern class Fs {

    @:native("ModeAppend") static var ModeAppend: go.io.fs.FileMode;
    @:native("ModeCharDevice") static var ModeCharDevice: go.io.fs.FileMode;
    @:native("ModeDevice") static var ModeDevice: go.io.fs.FileMode;
    @:native("ModeDir") static var ModeDir: go.io.fs.FileMode;
    @:native("ModeExclusive") static var ModeExclusive: go.io.fs.FileMode;
    @:native("ModeIrregular") static var ModeIrregular: go.io.fs.FileMode;
    @:native("ModeNamedPipe") static var ModeNamedPipe: go.io.fs.FileMode;
    @:native("ModePerm") static var ModePerm: go.io.fs.FileMode;
    @:native("ModeSetgid") static var ModeSetgid: go.io.fs.FileMode;
    @:native("ModeSetuid") static var ModeSetuid: go.io.fs.FileMode;
    @:native("ModeSocket") static var ModeSocket: go.io.fs.FileMode;
    @:native("ModeSticky") static var ModeSticky: go.io.fs.FileMode;
    @:native("ModeSymlink") static var ModeSymlink: go.io.fs.FileMode;
    @:native("ModeTemporary") static var ModeTemporary: go.io.fs.FileMode;
    @:native("ModeType") static var ModeType: go.io.fs.FileMode;

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