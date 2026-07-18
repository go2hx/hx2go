package sys.io;

import go.Os;
import go.Go;
import go.Slice;
import go.Byte;
import haxe.io.Bytes;

class File {

    public static function getContent(path: String): String {
        return Go.string(Os.readFile(path).sure());
    }

    public static function saveContent(path: String, content: String): Void {
        // 0666, umask is applied by the OS
        Os.writeFile(path, Slice.fromString(content), Go.uint32(0x1B6)).sure();
    }

    public static function getBytes(path: String): Bytes {
        var slice: Slice<Byte> = Os.readFile(path).sure();
        var arr = slice.toArray();
        var out = Bytes.alloc(arr.length);
        for (i in 0...arr.length) {
            out.set(i, cast arr[i]);
        }
        return out;
    }

    public static function saveBytes(path: String, bytes: Bytes): Void {
        var n = bytes.length;
        var slice = new Slice<Byte>(n);
        for (i in 0...n) {
            slice[i] = cast bytes.get(i);
        }
        Os.writeFile(path, slice, Go.uint32(0x1B6)).sure();
    }

}
