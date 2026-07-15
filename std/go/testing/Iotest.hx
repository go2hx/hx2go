package go.testing;

@:go.Type({ name: "iotest", instanceName: "iotest.iotest", imports: ["testing/iotest"] })
extern class Iotest {

    @:native("DataErrReader") static function dataErrReader(r: go.io.Reader): go.io.Reader;
    @:native("ErrReader") static function errReader(err: go.Error): go.io.Reader;
    @:native("HalfReader") static function halfReader(r: go.io.Reader): go.io.Reader;
    @:native("NewReadLogger") static function newReadLogger(prefix: String, r: go.io.Reader): go.io.Reader;
    @:native("NewWriteLogger") static function newWriteLogger(prefix: String, w: go.io.Writer): go.io.Writer;
    @:native("OneByteReader") static function oneByteReader(r: go.io.Reader): go.io.Reader;
    @:native("TestReader") static function testReader(r: go.io.Reader, content: go.Slice<go.Byte>): go.Error;
    @:native("TimeoutReader") static function timeoutReader(r: go.io.Reader): go.io.Reader;
    @:native("TruncateWriter") static function truncateWriter(w: go.io.Writer, n: go.Int64): go.io.Writer;

}