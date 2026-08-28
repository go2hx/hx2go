package go.encoding.csv;

/**
    A Reader reads records from a CSV-encoded file.
    
    As returned by [NewReader], a Reader expects input conforming to RFC 4180.
    The exported fields can be changed to customize the details before the
    first call to [Reader.Read] or [Reader.ReadAll].
    
    The Reader converts all \r\n sequences in its input to plain \n,
    including in multiline field values, so that the returned data does
    not depend on which line-ending convention an input file uses.
**/
@:structInit
@:go.Type({ name: "Reader", instanceName: "csv.Reader", imports: ["encoding/csv"] })
extern class Reader {

    @:native("Comma") var comma: go.Rune;
    @:native("Comment") var comment: go.Rune;
    @:native("FieldsPerRecord") var fieldsPerRecord: go.GoInt;
    @:native("LazyQuotes") var lazyQuotes: Bool;
    @:native("TrimLeadingSpace") var trimLeadingSpace: Bool;
    @:native("ReuseRecord") var reuseRecord: Bool;
    @:native("TrailingComma") var trailingComma: Bool;

    function new(comma: go.Rune=0, comment: go.Rune=0, fieldsPerRecord: go.GoInt=0, lazyQuotes: Bool=false, trimLeadingSpace: Bool=false, reuseRecord: Bool=false, trailingComma: Bool=false);

    /**
        FieldPos returns the line and column corresponding to
        the start of the field with the given index in the slice most recently
        returned by [Reader.Read]. Numbering of lines and columns starts at 1;
        columns are counted in bytes, not runes.
        
        If this is called with an out-of-bounds index, it panics.
    **/
    @:go.Tuple("line", "column") @:native("FieldPos") function fieldPos(field: go.GoInt): (go.Tuple<{ line: go.GoInt, column: go.GoInt }>);
    /**
        InputOffset returns the input stream byte offset of the current reader
        position. The offset gives the location of the end of the most recently
        read row and the beginning of the next row.
    **/
    @:native("InputOffset") function inputOffset(): (go.Int64);
    /**
        Read reads one record (a slice of fields) from r.
        If the record has an unexpected number of fields,
        Read returns the record along with the error [ErrFieldCount].
        If the record contains a field that cannot be parsed,
        Read returns a partial record along with the parse error.
        The partial record contains all fields read before the error.
        If there is no data left to be read, Read returns nil, [io.EOF].
        If [Reader.ReuseRecord] is true, the returned slice may be shared
        between multiple calls to Read.
    **/
    @:native("Read") function read(): (go.Result<go.Slice<String>>);
    /**
        ReadAll reads all the remaining records from r.
        Each record is a slice of fields.
        A successful call returns err == nil, not err == [io.EOF]. Because ReadAll is
        defined to read until EOF, it does not treat end of file as an error to be
        reported.
    **/
    @:native("ReadAll") function readAll(): (go.Result<go.Slice<go.Slice<String>>>);

}