package go.io;

@:go.Type({ name: "ioutil", instanceName: "ioutil.ioutil", imports: ["io/ioutil"] })
extern class Ioutil {

    @:native("Discard") static var Discard: go.io.Writer;

    @:native("NopCloser") static function nopCloser(r: go.io.Reader): go.io.ReadCloser;
    @:native("ReadAll") static function readAll(r: go.io.Reader): go.Result<go.Slice<go.Byte>>;
    @:native("ReadDir") static function readDir(dirname: String): go.Result<go.Slice<go.io.fs.FileInfo>>;
    @:native("ReadFile") static function readFile(filename: String): go.Result<go.Slice<go.Byte>>;
    @:native("TempDir") static function tempDir(dir: String, pattern: String): go.Result<String>;
    @:native("TempFile") static function tempFile(dir: String, pattern: String): go.Result<go.Pointer<go.os.File>>;
    @:native("WriteFile") static function writeFile(filename: String, data: go.Slice<go.Byte>, perm: go.io.fs.FileMode): go.Error;

}