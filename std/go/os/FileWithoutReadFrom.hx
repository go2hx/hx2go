package go.os;

@:structInit
@:go.Type({ name: "fileWithoutReadFrom", instanceName: "os.fileWithoutReadFrom", imports: ["os"] })
extern class FileWithoutReadFrom {

    @:native("File") var file: go.Pointer<go.os.File>;

    function new(file: go.Pointer<go.os.File>);

    @:native("Chdir") function chdir(): (go.Error);
    @:native("Chmod") function chmod(mode: go.os.FileMode): (go.Error);
    @:native("Chown") function chown(uid: go.GoInt, gid: go.GoInt): (go.Error);
    @:native("Close") function close(): (go.Error);
    @:native("Fd") function fd(): (go.UIntPtr);
    @:native("Name") function name(): (String);
    @:native("Read") function read(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("ReadAt") function readAt(b: go.Slice<go.Byte>, off: go.Int64): (go.Result<go.GoInt>);
    @:native("ReadDir") function readDir(n: go.GoInt): (go.Result<go.Slice<go.os.DirEntry>>);
    @:native("Readdir") function readdir(n: go.GoInt): (go.Result<go.Slice<go.os.FileInfo>>);
    @:native("Readdirnames") function readdirnames(n: go.GoInt): (go.Result<go.Slice<String>>);
    @:native("Seek") function seek(offset: go.Int64, whence: go.GoInt): (go.Result<go.Int64>);
    @:native("SetDeadline") function setDeadline(t: go.time.Time): (go.Error);
    @:native("SetReadDeadline") function setReadDeadline(t: go.time.Time): (go.Error);
    @:native("SetWriteDeadline") function setWriteDeadline(t: go.time.Time): (go.Error);
    @:native("Stat") function stat(): (go.Result<go.os.FileInfo>);
    @:native("Sync") function sync(): (go.Error);
    @:native("SyscallConn") function syscallConn(): (go.Result<go.syscall.RawConn>);
    @:native("Truncate") function truncate(size: go.Int64): (go.Error);
    @:native("Write") function write(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("WriteAt") function writeAt(b: go.Slice<go.Byte>, off: go.Int64): (go.Result<go.GoInt>);
    @:native("WriteString") function writeString(s: String): (go.Result<go.GoInt>);
    @:native("WriteTo") function writeTo(w: go.io.Writer): (go.Result<go.Int64>);

}