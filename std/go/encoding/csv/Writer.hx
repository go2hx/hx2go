package go.encoding.csv;

/**
    A Writer writes records using CSV encoding.
    
    As returned by [NewWriter], a Writer writes records terminated by a
    newline and uses ',' as the field delimiter. The exported fields can be
    changed to customize the details before
    the first call to [Writer.Write] or [Writer.WriteAll].
    
    [Writer.Comma] is the field delimiter.
    
    If [Writer.UseCRLF] is true,
    the Writer ends each output line with \r\n instead of \n.
    
    The writes of individual records are buffered.
    After all data has been written, the client should call the
    [Writer.Flush] method to guarantee all data has been forwarded to
    the underlying [io.Writer].  Any errors that occurred should
    be checked by calling the [Writer.Error] method.
**/
@:structInit
@:go.Type({ name: "Writer", instanceName: "csv.Writer", imports: ["encoding/csv"] })
extern class Writer {

    @:native("Comma") var comma: go.Rune;
    @:native("UseCRLF") var useCRLF: Bool;

    function new(comma: go.Rune=0, useCRLF: Bool=false);

    /**
        Error reports any error that has occurred during
        a previous [Writer.Write] or [Writer.Flush].
    **/
    @:native("Error") function error(): (go.Error);
    /**
        Flush writes any buffered data to the underlying [io.Writer].
        To check if an error occurred during Flush, call [Writer.Error].
    **/
    @:native("Flush") function flush(): Void;
    /**
        Write writes a single CSV record to w along with any necessary quoting.
        A record is a slice of strings with each string being one field.
        Writes are buffered, so [Writer.Flush] must eventually be called to ensure
        that the record is written to the underlying [io.Writer].
    **/
    @:native("Write") function write(record: go.Slice<String>): (go.Error);
    /**
        WriteAll writes multiple CSV records to w using [Writer.Write] and
        then calls [Writer.Flush], returning any error from the Flush.
    **/
    @:native("WriteAll") function writeAll(records: go.Slice<go.Slice<String>>): (go.Error);

}