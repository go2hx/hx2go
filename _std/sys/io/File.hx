package sys.io;

import go.Os;
import go.Go;
import go.Slice;
import go.Byte;
import haxe.io.Bytes;
import go.Syntax;

class File {

    public static function getContent(path: String): String {
        return Go.string(Os.readFile(path).sure());
    }

    public static function saveContent(path: String, content: String): Void {
        Os.writeFile(path, Slice.fromString(content), Syntax.code("0666")).sure();
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
        Os.writeFile(path, slice, Syntax.code("0666")).sure();
    }

    @:access(sys.io.FileInput)
    public static function read(path:String, binary:Bool = true):FileInput {
        return new FileInput(Os.open(path).sure());
    }

    @:access(sys.io.FileOutput)
    public static function write(path:String, binary:Bool = true):FileOutput {
        return new FileOutput(Os.create(path).sure());
    }

    public static function append(path:String, binary:Bool = true):FileOutput {
        throw "not implemented"; // TODO: os.OpenFile with O_APPEND|O_CREATE|O_WRONLY
    }

    public static function update(path:String, binary:Bool = true):FileOutput {
        throw "not implemented"; // TODO: os.OpenFile with O_RDWR|O_CREATE
    }

    public static function copy(srcPath:String, dstPath:String):Void {
        saveBytes(dstPath, getBytes(srcPath));
    }

}
