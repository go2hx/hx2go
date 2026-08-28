package go;

/**
    Package bufio implements buffered I/O. It wraps an io.Reader or io.Writer
    object, creating another object (Reader or Writer) that also implements
    the interface but provides buffering and some help for textual I/O.
**/
@:go.Type({ name: "bufio", instanceName: "bufio.bufio", imports: ["bufio"] })
extern class Bufio {

    @:native("MaxScanTokenSize") static var maxScanTokenSize: go.GoInt;

    /**
        NewReadWriter allocates a new [ReadWriter] that dispatches to r and w.
    **/
    @:native("NewReadWriter") static function newReadWriter(r: go.Pointer<go.bufio.Reader>, w: go.Pointer<go.bufio.Writer>): (go.Pointer<go.bufio.ReadWriter>);
    /**
        NewReader returns a new [Reader] whose buffer has the default size.
    **/
    @:native("NewReader") static function newReader(rd: go.io.Reader): (go.Pointer<go.bufio.Reader>);
    /**
        NewReaderSize returns a new [Reader] whose buffer has at least the specified
        size. If the argument io.Reader is already a [Reader] with large enough
        size, it returns the underlying [Reader].
    **/
    @:native("NewReaderSize") static function newReaderSize(rd: go.io.Reader, size: go.GoInt): (go.Pointer<go.bufio.Reader>);
    /**
        NewScanner returns a new [Scanner] to read from r.
        The split function defaults to [ScanLines].
    **/
    @:native("NewScanner") static function newScanner(r: go.io.Reader): (go.Pointer<go.bufio.Scanner>);
    /**
        NewWriter returns a new [Writer] whose buffer has the default size.
        If the argument io.Writer is already a [Writer] with large enough buffer size,
        it returns the underlying [Writer].
    **/
    @:native("NewWriter") static function newWriter(w: go.io.Writer): (go.Pointer<go.bufio.Writer>);
    /**
        NewWriterSize returns a new [Writer] whose buffer has at least the specified
        size. If the argument io.Writer is already a [Writer] with large enough
        size, it returns the underlying [Writer].
    **/
    @:native("NewWriterSize") static function newWriterSize(w: go.io.Writer, size: go.GoInt): (go.Pointer<go.bufio.Writer>);
    /**
        ScanBytes is a split function for a [Scanner] that returns each byte as a token.
    **/
    @:go.Tuple("advance", "token", "err") @:native("ScanBytes") static function scanBytes(data: go.Slice<go.Byte>, atEOF: Bool): (go.Tuple<{ advance: go.GoInt, token: go.Slice<go.Byte>, err: go.Error }>);
    /**
        ScanLines is a split function for a [Scanner] that returns each line of
        text, stripped of any trailing end-of-line marker. The returned line may
        be empty. The end-of-line marker is one optional carriage return followed
        by one mandatory newline. In regular expression notation, it is `\r?\n`.
        The last non-empty line of input will be returned even if it has no
        newline.
    **/
    @:go.Tuple("advance", "token", "err") @:native("ScanLines") static function scanLines(data: go.Slice<go.Byte>, atEOF: Bool): (go.Tuple<{ advance: go.GoInt, token: go.Slice<go.Byte>, err: go.Error }>);
    /**
        ScanRunes is a split function for a [Scanner] that returns each
        UTF-8-encoded rune as a token. The sequence of runes returned is
        equivalent to that from a range loop over the input as a string, which
        means that erroneous UTF-8 encodings translate to U+FFFD = "\xef\xbf\xbd".
        Because of the Scan interface, this makes it impossible for the client to
        distinguish correctly encoded replacement runes from encoding errors.
    **/
    @:go.Tuple("advance", "token", "err") @:native("ScanRunes") static function scanRunes(data: go.Slice<go.Byte>, atEOF: Bool): (go.Tuple<{ advance: go.GoInt, token: go.Slice<go.Byte>, err: go.Error }>);
    /**
        ScanWords is a split function for a [Scanner] that returns each
        space-separated word of text, with surrounding spaces deleted. It will
        never return an empty string. The definition of space is set by
        unicode.IsSpace.
    **/
    @:go.Tuple("advance", "token", "err") @:native("ScanWords") static function scanWords(data: go.Slice<go.Byte>, atEOF: Bool): (go.Tuple<{ advance: go.GoInt, token: go.Slice<go.Byte>, err: go.Error }>);

}