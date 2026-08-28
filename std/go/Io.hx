package go;

/**
    Package io provides basic interfaces to I/O primitives.
    Its primary job is to wrap existing implementations of such primitives,
    such as those in package os, into shared public interfaces that
    abstract the functionality, plus some other related primitives.
    
    Because these interfaces and primitives wrap lower-level operations with
    various implementations, unless otherwise informed clients should not
    assume they are safe for parallel execution.
**/
@:go.Type({ name: "io", instanceName: "io.io", imports: ["io"] })
extern class Io {

    /**
        Seek whence values.
    **/
    @:native("SeekCurrent") static var seekCurrent: go.GoInt;
    /**
        Seek whence values.
    **/
    @:native("SeekEnd") static var seekEnd: go.GoInt;
    /**
        Seek whence values.
    **/
    @:native("SeekStart") static var seekStart: go.GoInt;

    /**
        Discard is a [Writer] on which all Write calls succeed
        without doing anything.
    **/
    @:native("Discard") static var discard: go.io.Writer;

    /**
        Copy copies from src to dst until either EOF is reached
        on src or an error occurs. It returns the number of bytes
        copied and the first error encountered while copying, if any.
        
        A successful Copy returns err == nil, not err == EOF.
        Because Copy is defined to read from src until EOF, it does
        not treat an EOF from Read as an error to be reported.
        
        If src implements [WriterTo],
        the copy is implemented by calling src.WriteTo(dst).
        Otherwise, if dst implements [ReaderFrom],
        the copy is implemented by calling dst.ReadFrom(src).
    **/
    @:native("Copy") static function copy(dst: go.io.Writer, src: go.io.Reader): (go.Result<go.Int64>);
    /**
        CopyBuffer is identical to Copy except that it stages through the
        provided buffer (if one is required) rather than allocating a
        temporary one. If buf is nil, one is allocated; otherwise if it has
        zero length, CopyBuffer panics.
        
        If either src implements [WriterTo] or dst implements [ReaderFrom],
        buf will not be used to perform the copy.
    **/
    @:native("CopyBuffer") static function copyBuffer(dst: go.io.Writer, src: go.io.Reader, buf: go.Slice<go.Byte>): (go.Result<go.Int64>);
    /**
        CopyN copies n bytes (or until an error) from src to dst.
        It returns the number of bytes copied and the earliest
        error encountered while copying.
        On return, written == n if and only if err == nil.
        
        If dst implements [ReaderFrom], the copy is implemented using it.
    **/
    @:native("CopyN") static function copyN(dst: go.io.Writer, src: go.io.Reader, n: go.Int64): (go.Result<go.Int64>);
    /**
        LimitReader returns a Reader that reads from r
        but stops with EOF after n bytes.
        The underlying implementation is a *LimitedReader.
    **/
    @:native("LimitReader") static function limitReader(r: go.io.Reader, n: go.Int64): (go.io.Reader);
    /**
        MultiReader returns a Reader that's the logical concatenation of
        the provided input readers. They're read sequentially. Once all
        inputs have returned EOF, Read will return EOF.  If any of the readers
        return a non-nil, non-EOF error, Read will return that error.
    **/
    @:native("MultiReader") static function multiReader(readers: haxe.Rest<go.io.Reader>): (go.io.Reader);
    /**
        MultiWriter creates a writer that duplicates its writes to all the
        provided writers, similar to the Unix tee(1) command.
        
        Each write is written to each listed writer, one at a time.
        If a listed writer returns an error, that overall write operation
        stops and returns the error; it does not continue down the list.
    **/
    @:native("MultiWriter") static function multiWriter(writers: haxe.Rest<go.io.Writer>): (go.io.Writer);
    /**
        NewOffsetWriter returns an [OffsetWriter] that writes to w
        starting at offset off.
    **/
    @:native("NewOffsetWriter") static function newOffsetWriter(w: go.io.WriterAt, off: go.Int64): (go.Pointer<go.io.OffsetWriter>);
    /**
        NewSectionReader returns a [SectionReader] that reads from r
        starting at offset off and stops with EOF after n bytes.
    **/
    @:native("NewSectionReader") static function newSectionReader(r: go.io.ReaderAt, off: go.Int64, n: go.Int64): (go.Pointer<go.io.SectionReader>);
    /**
        NopCloser returns a [ReadCloser] with a no-op Close method wrapping
        the provided [Reader] r.
        If r implements [WriterTo], the returned [ReadCloser] will implement [WriterTo]
        by forwarding calls to r.
    **/
    @:native("NopCloser") static function nopCloser(r: go.io.Reader): (go.io.ReadCloser);
    /**
        Pipe creates a synchronous in-memory pipe.
        It can be used to connect code expecting an [io.Reader]
        with code expecting an [io.Writer].
        
        Reads and Writes on the pipe are matched one to one
        except when multiple Reads are needed to consume a single Write.
        That is, each Write to the [PipeWriter] blocks until it has satisfied
        one or more Reads from the [PipeReader] that fully consume
        the written data.
        The data is copied directly from the Write to the corresponding
        Read (or Reads); there is no internal buffering.
        
        It is safe to call Read and Write in parallel with each other or with Close.
        Parallel calls to Read and parallel calls to Write are also safe:
        the individual calls will be gated sequentially.
    **/
    @:go.Tuple("p0", "p1") @:native("Pipe") static function pipe(): (go.Tuple<{ p0: go.Pointer<go.io.PipeReader>, p1: go.Pointer<go.io.PipeWriter> }>);
    /**
        ReadAll reads from r until an error or EOF and returns the data it read.
        A successful call returns err == nil, not err == EOF. Because ReadAll is
        defined to read from src until EOF, it does not treat an EOF from Read
        as an error to be reported.
    **/
    @:native("ReadAll") static function readAll(r: go.io.Reader): (go.Result<go.Slice<go.Byte>>);
    /**
        ReadAtLeast reads from r into buf until it has read at least min bytes.
        It returns the number of bytes copied and an error if fewer bytes were read.
        The error is EOF only if no bytes were read.
        If an EOF happens after reading fewer than min bytes,
        ReadAtLeast returns [ErrUnexpectedEOF].
        If min is greater than the length of buf, ReadAtLeast returns [ErrShortBuffer].
        On return, n >= min if and only if err == nil.
        If r returns an error having read at least min bytes, the error is dropped.
    **/
    @:native("ReadAtLeast") static function readAtLeast(r: go.io.Reader, buf: go.Slice<go.Byte>, min: go.GoInt): (go.Result<go.GoInt>);
    /**
        ReadFull reads exactly len(buf) bytes from r into buf.
        It returns the number of bytes copied and an error if fewer bytes were read.
        The error is EOF only if no bytes were read.
        If an EOF happens after reading some but not all the bytes,
        ReadFull returns [ErrUnexpectedEOF].
        On return, n == len(buf) if and only if err == nil.
        If r returns an error having read at least len(buf) bytes, the error is dropped.
    **/
    @:native("ReadFull") static function readFull(r: go.io.Reader, buf: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    /**
        TeeReader returns a [Reader] that writes to w what it reads from r.
        All reads from r performed through it are matched with
        corresponding writes to w. There is no internal buffering -
        the write must complete before the read completes.
        Any error encountered while writing is reported as a read error.
    **/
    @:native("TeeReader") static function teeReader(r: go.io.Reader, w: go.io.Writer): (go.io.Reader);
    /**
        WriteString writes the contents of the string s to w, which accepts a slice of bytes.
        If w implements [StringWriter], [StringWriter.WriteString] is invoked directly.
        Otherwise, [Writer.Write] is called exactly once.
    **/
    @:native("WriteString") static function writeString(w: go.io.Writer, s: String): (go.Result<go.GoInt>);

}