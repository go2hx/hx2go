package go.archive.zip;

@:structInit
@:go.Type({ name: "ReadCloser", instanceName: "zip.ReadCloser", imports: ["archive/zip"] })
extern class ReadCloser {

    @:native("Reader") var reader: go.archive.zip.Reader;

function new(reader: go.archive.zip.Reader);

    @:native("Close") function close(): go.Error;
    @:native("Open") function open(name: String): go.Result<go.io.fs.File>;
    @:native("RegisterDecompressor") function registerDecompressor(method: go.UInt16, dcomp: go.archive.zip.Decompressor): Void;

}