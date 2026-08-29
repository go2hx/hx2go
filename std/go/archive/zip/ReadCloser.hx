package go.archive.zip;

/**
    A ReadCloser is a [Reader] that must be closed when no longer needed.
**/
@:structInit
@:go.Type({ name: "ReadCloser", instanceName: "zip.ReadCloser", imports: ["archive/zip"] })
extern class ReadCloser {

    @:native("Reader") var reader: go.archive.zip.Reader;
    @:native("File") var file: go.Slice<go.Pointer<go.archive.zip.File>>;
    @:native("Comment") var comment: String;

    function new(reader: go.archive.zip.Reader);

    /**
        Close closes the Zip file, rendering it unusable for I/O.
    **/
    @:native("Close") function close(): (go.Error);
    @:native("Open") function open(name: String): (go.Result<go.io.fs.File>);
    @:native("RegisterDecompressor") function registerDecompressor(method: go.UInt16, dcomp: go.archive.zip.Decompressor): Void;

}