package go.os;

@:structInit
@:go.Type({ name: "Root", instanceName: "os.Root", imports: ["os"] })
extern class Root {

    @:native("Chmod") function chmod(name: String, mode: go.os.FileMode): (go.Error);
    @:native("Chown") function chown(name: String, uid: go.GoInt, gid: go.GoInt): (go.Error);
    @:native("Chtimes") function chtimes(name: String, atime: go.time.Time, mtime: go.time.Time): (go.Error);
    @:native("Close") function close(): (go.Error);
    @:native("Create") function create(name: String): (go.Result<go.Pointer<go.os.File>>);
    @:native("FS") function FS(): (go.io.fs.FS);
    @:native("Lchown") function lchown(name: String, uid: go.GoInt, gid: go.GoInt): (go.Error);
    @:native("Link") function link(oldname: String, newname: String): (go.Error);
    @:native("Lstat") function lstat(name: String): (go.Result<go.os.FileInfo>);
    @:native("Mkdir") function mkdir(name: String, perm: go.os.FileMode): (go.Error);
    @:native("MkdirAll") function mkdirAll(name: String, perm: go.os.FileMode): (go.Error);
    @:native("Name") function name(): (String);
    @:native("Open") function open(name: String): (go.Result<go.Pointer<go.os.File>>);
    @:native("OpenFile") function openFile(name: String, flag: go.GoInt, perm: go.os.FileMode): (go.Result<go.Pointer<go.os.File>>);
    @:native("OpenRoot") function openRoot(name: String): (go.Result<go.Pointer<go.os.Root>>);
    @:native("ReadFile") function readFile(name: String): (go.Result<go.Slice<go.Byte>>);
    @:native("Readlink") function readlink(name: String): (go.Result<String>);
    @:native("Remove") function remove(name: String): (go.Error);
    @:native("RemoveAll") function removeAll(name: String): (go.Error);
    @:native("Rename") function rename(oldname: String, newname: String): (go.Error);
    @:native("Stat") function stat(name: String): (go.Result<go.os.FileInfo>);
    @:native("Symlink") function symlink(oldname: String, newname: String): (go.Error);
    @:native("WriteFile") function writeFile(name: String, data: go.Slice<go.Byte>, perm: go.os.FileMode): (go.Error);

}