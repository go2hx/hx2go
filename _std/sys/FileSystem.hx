package sys;

import go.os.DirEntry;
import go.Slice;
import go.path.Filepath;
import go.Path;
import go.Os;
import go.Go;

class FileSystem {

    private static function sanitizePath(path:String): String {
        if (path == null) {
            path = "";
        }
        var trailingSlash = go.Go.string(Os.pathSeparator);
        if (path == trailingSlash) {
            return path;  // if the path is just the trailing slash, we are refering to the root directory - tested by the Haxe Sys filesystem tests
        }
        path = go.Strings.trimSuffix(path, trailingSlash);
        return path;
    } 

    public static function exists(path: String): Bool {
        path = sanitizePath(path);
        return Os.stat(path).isOk();
    }

    public static function isDirectory(path: String): Bool {
        path = sanitizePath(path);
        var r = Os.stat(path);
        if (!r.isOk()) return false;
        return r.sure().isDir();
    }

    public static function createDirectory(path: String): Void {
        path = sanitizePath(path);
        // 0777, umask is applied by the OS.
        Os.mkdirAll(path, Go.uint32(0x1FF)).sure();
    }

    public static function readDirectory(path:String):Array<String> {
        path = sanitizePath(path);
        var list:Slice<DirEntry> = Os.readDir(path).sure();
        return list.toArray().map(res -> res.name());
    }

    public static function deleteFile(path: String): Void {
        Os.remove(path).sure();
    }

    public static function deleteDirectory(path: String): Void {
        path = sanitizePath(path);
        Os.removeAll(path).sure();
    }

    public static function rename(path: String, newPath: String): Void {
        path = sanitizePath(path);
        newPath = sanitizePath(newPath);
        Os.rename(path, newPath).sure();
    }

    public static function absolutePath(relPath:String):String {
        relPath = sanitizePath(relPath);
        if (relPath.length > 1 && relPath.charAt(1) == ':') { // Windows absolute path with drive letter
            return relPath;
        }
        return Filepath.abs(relPath).sure();
    }

    public static function fullPath(relPath:String):String {
        relPath = sanitizePath(relPath);
        return Filepath.abs(relPath).sure();
    }

    public static function stat(path:String):sys.FileStat {
        path = sanitizePath(path);
        var info = Os.stat(path).sure();
        var mtime = Date.fromTime(info.modTime().unixMilli().toFloat());
        return {
            gid: 0,
            uid: 0,
            atime: mtime,
            mtime: mtime,
            ctime: mtime,
            size: Go.int(info.size()),
            dev: 0,
            ino: 0,
            nlink: 0,
            rdev: 0,
            mode: Go.int(info.mode())
        };
    }
}
