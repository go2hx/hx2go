package go.archive.zip;

@:structInit
@:go.Type({ name: "FileHeader", instanceName: "zip.FileHeader", imports: ["archive/zip"] })
extern class FileHeader {

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

function new(name: String, comment: String, nonUTF8: Bool, creatorVersion: go.UInt16, readerVersion: go.UInt16, flags: go.UInt16, method: go.UInt16, modified: go.time.Time, modifiedTime: go.UInt16, modifiedDate: go.UInt16, CRC32: go.UInt32, compressedSize: go.UInt32, uncompressedSize: go.UInt32, compressedSize64: go.UInt64, uncompressedSize64: go.UInt64, extra: go.Slice<go.Byte>, externalAttrs: go.UInt32);

    @:native("FileInfo") function fileInfo(): go.io.fs.FileInfo;
    @:native("ModTime") function modTime(): go.time.Time;
    @:native("Mode") function mode(): go.io.fs.FileMode;
    @:native("SetModTime") function setModTime(t: go.time.Time): Void;
    @:native("SetMode") function setMode(mode: go.io.fs.FileMode): Void;

}