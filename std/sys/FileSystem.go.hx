package sys;

import go.Os;
import go.Go;

class FileSystem {

    public static function exists(path: String): Bool {
        return Os.stat(path).isOk();
    }

    public static function isDirectory(path: String): Bool {
        var r = Os.stat(path);
        if (!r.isOk()) return false;
        return r.sure().isDir();
    }

    public static function createDirectory(path: String): Void {
        // 0777, umask is applied by the OS.
        Os.mkdirAll(path, Go.uint32(0x1FF)).sure();
    }

    public static function deleteFile(path: String): Void {
        Os.remove(path).sure();
    }

    public static function deleteDirectory(path: String): Void {
        Os.removeAll(path).sure();
    }

    public static function rename(path: String, newPath: String): Void {
        Os.rename(path, newPath).sure();
    }

}
