package go.archive.zip;

@:structInit
@:go.Type({ name: "File", instanceName: "zip.File", imports: ["archive/zip"] })
extern class File {

    @:native("FileHeader") var fileHeader: go.archive.zip.FileHeader;
    @:native("Name") var name: String;
    @:native("Comment") var comment: String;
    @:native("NonUTF8") var nonUTF8: Bool;
    @:native("CreatorVersion") var creatorVersion: go.UInt16;
    @:native("ReaderVersion") var readerVersion: go.UInt16;
    @:native("Flags") var flags: go.UInt16;
    @:native("Method") var method: go.UInt16;
    @:native("Modified") var modified: go.time.Time;
    @:native("ModifiedTime") var modifiedTime: go.UInt16;
    @:native("ModifiedDate") var modifiedDate: go.UInt16;
    @:native("CRC32") var CRC32: go.UInt32;
    @:native("CompressedSize") var compressedSize: go.UInt32;
    @:native("UncompressedSize") var uncompressedSize: go.UInt32;
    @:native("CompressedSize64") var compressedSize64: go.UInt64;
    @:native("UncompressedSize64") var uncompressedSize64: go.UInt64;
    @:native("Extra") var extra: go.Slice<go.Byte>;
    @:native("ExternalAttrs") var externalAttrs: go.UInt32;

    function new(fileHeader: go.archive.zip.FileHeader);

    @:native("DataOffset") function dataOffset(): (go.Result<go.Int64>);
    @:native("FileInfo") function fileInfo(): (go.io.fs.FileInfo);
    @:native("ModTime") function modTime(): (go.time.Time);
    @:native("Mode") function mode(): (go.io.fs.FileMode);
    @:native("Open") function open(): (go.Result<go.io.ReadCloser>);
    @:native("OpenRaw") function openRaw(): (go.Result<go.io.Reader>);
    @:native("SetModTime") function setModTime(t: go.time.Time): Void;
    @:native("SetMode") function setMode(mode: go.io.fs.FileMode): Void;

}