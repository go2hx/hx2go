package go.archive;

@:go.Type({ name: "zip", instanceName: "zip.zip", imports: ["archive/zip"] })
extern class Zip {

    @:native("Deflate") static var Deflate: go.UInt16;
    @:native("Store") static var Store: go.UInt16;

    @:native("FileInfoHeader") static function fileInfoHeader(fi: go.io.fs.FileInfo): go.Result<go.Pointer<go.archive.zip.FileHeader>>;
    @:native("NewReader") static function newReader(r: go.io.ReaderAt, size: go.Int64): go.Result<go.Pointer<go.archive.zip.Reader>>;
    @:native("NewWriter") static function newWriter(w: go.io.Writer): go.Pointer<go.archive.zip.Writer>;
    @:native("OpenReader") static function openReader(name: String): go.Result<go.Pointer<go.archive.zip.ReadCloser>>;
    @:native("RegisterCompressor") static function registerCompressor(method: go.UInt16, comp: go.archive.zip.Compressor): Void;
    @:native("RegisterDecompressor") static function registerDecompressor(method: go.UInt16, dcomp: go.archive.zip.Decompressor): Void;

}