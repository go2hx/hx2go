package go.testing;

/**
    Package iotest implements Readers and Writers useful mainly for testing.
**/
@:go.Type({ name: "iotest", instanceName: "iotest.iotest", imports: ["testing/iotest"] })
extern class Iotest {

    /**
        DataErrReader changes the way errors are handled by a Reader. Normally, a
        Reader returns an error (typically EOF) from the first Read call after the
        last piece of data is read. DataErrReader wraps a Reader and changes its
        behavior so the final error is returned along with the final data, instead
        of in the first call after the final data.
    **/
    @:native("DataErrReader") static function dataErrReader(r: go.io.Reader): (go.io.Reader);
    /**
        ErrReader returns an [io.Reader] that returns 0, err from all Read calls.
    **/
    @:native("ErrReader") static function errReader(err: go.Error): (go.io.Reader);
    /**
        HalfReader returns a Reader that implements Read
        by reading half as many requested bytes from r.
    **/
    @:native("HalfReader") static function halfReader(r: go.io.Reader): (go.io.Reader);
    /**
        NewReadLogger returns a reader that behaves like r except
        that it logs (using [log.Printf]) each read to standard error,
        printing the prefix and the hexadecimal data read.
    **/
    @:native("NewReadLogger") static function newReadLogger(prefix: String, r: go.io.Reader): (go.io.Reader);
    /**
        NewWriteLogger returns a writer that behaves like w except
        that it logs (using [log.Printf]) each write to standard error,
        printing the prefix and the hexadecimal data written.
    **/
    @:native("NewWriteLogger") static function newWriteLogger(prefix: String, w: go.io.Writer): (go.io.Writer);
    /**
        OneByteReader returns a Reader that implements
        each non-empty Read by reading one byte from r.
    **/
    @:native("OneByteReader") static function oneByteReader(r: go.io.Reader): (go.io.Reader);
    /**
        TestReader tests that reading from r returns the expected file content.
        It does reads of different sizes, until EOF.
        If r implements [io.ReaderAt] or [io.Seeker], TestReader also checks
        that those operations behave as they should.
        
        If TestReader finds any misbehaviors, it returns an error reporting them.
        The error text may span multiple lines.
    **/
    @:native("TestReader") static function testReader(r: go.io.Reader, content: go.Slice<go.Byte>): (go.Error);
    /**
        TimeoutReader returns [ErrTimeout] on the second read
        with no data. Subsequent calls to read succeed.
    **/
    @:native("TimeoutReader") static function timeoutReader(r: go.io.Reader): (go.io.Reader);
    /**
        TruncateWriter returns a Writer that writes to w
        but stops silently after n bytes.
    **/
    @:native("TruncateWriter") static function truncateWriter(w: go.io.Writer, n: go.Int64): (go.io.Writer);

}