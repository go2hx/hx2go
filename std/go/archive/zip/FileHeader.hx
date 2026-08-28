package go.archive.zip;

/**
    FileHeader describes a file within a ZIP file.
    See the [ZIP specification] for details.
    
    [ZIP specification]: https://support.pkware.com/pkzip/appnote
**/
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

    function new(name: String="", comment: String="", nonUTF8: Bool=false, creatorVersion: go.UInt16=0, readerVersion: go.UInt16=0, flags: go.UInt16=0, method: go.UInt16=0, modified: go.time.Time, modifiedTime: go.UInt16=0, modifiedDate: go.UInt16=0, CRC32: go.UInt32=0, compressedSize: go.UInt32=0, uncompressedSize: go.UInt32=0, compressedSize64: go.UInt64=0, uncompressedSize64: go.UInt64=0, extra: go.Slice<go.Byte>=null, externalAttrs: go.UInt32=0);

    /**
        FileInfo returns an fs.FileInfo for the [FileHeader].
    **/
    @:native("FileInfo") function fileInfo(): (go.io.fs.FileInfo);
    /**
        ModTime returns the modification time in UTC using the legacy
        [ModifiedDate] and [ModifiedTime] fields.
        
        Deprecated: Use [Modified] instead.
    **/
    @:native("ModTime") function modTime(): (go.time.Time);
    /**
        Mode returns the permission and mode bits for the [FileHeader].
    **/
    @:native("Mode") function mode(): (go.io.fs.FileMode);
    /**
        SetModTime sets the [Modified], [ModifiedTime], and [ModifiedDate] fields
        to the given time in UTC.
        
        Deprecated: Use [Modified] instead.
    **/
    @:native("SetModTime") function setModTime(t: go.time.Time): Void;
    /**
        SetMode changes the permission and mode bits for the [FileHeader].
    **/
    @:native("SetMode") function setMode(mode: go.io.fs.FileMode): Void;

}