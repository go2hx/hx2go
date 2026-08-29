package go.archive;

/**
    Package zip provides support for reading and writing ZIP archives.
    
    See the [ZIP specification] for details.
    
    This package does not support disk spanning.
    
    A note about ZIP64:
    
    To be backwards compatible the FileHeader has both 32 and 64 bit Size
    fields. The 64 bit fields will always contain the correct value and
    for normal archives both fields will be the same. For files requiring
    the ZIP64 format the 32 bit fields will be 0xffffffff and the 64 bit
    fields must be used instead.
    
    [ZIP specification]: https://support.pkware.com/pkzip/appnote
**/
@:go.Type({ name: "zip", instanceName: "zip.zip", imports: ["archive/zip"] })
extern class Zip {

    /**
        Compression methods.
    **/
    @:native("Deflate") static var deflate: go.UInt16;
    /**
        Compression methods.
    **/
    @:native("Store") static var store: go.UInt16;

    /**
        FileInfoHeader creates a partially-populated [FileHeader] from an
        fs.FileInfo.
        Because fs.FileInfo's Name method returns only the base name of
        the file it describes, it may be necessary to modify the Name field
        of the returned header to provide the full path name of the file.
        If compression is desired, callers should set the FileHeader.Method
        field; it is unset by default.
    **/
    @:native("FileInfoHeader") static function fileInfoHeader(fi: go.io.fs.FileInfo): (go.Result<go.Pointer<go.archive.zip.FileHeader>>);
    /**
        NewReader returns a new [Reader] reading from r, which is assumed to
        have the given size in bytes.
        
        If any file inside the archive uses a non-local name
        (as defined by [filepath.IsLocal]) or a name containing backslashes
        and the GODEBUG environment variable contains `zipinsecurepath=0`,
        NewReader returns the reader with an [ErrInsecurePath] error.
        A future version of Go may introduce this behavior by default.
        Programs that want to accept non-local names can ignore
        the [ErrInsecurePath] error and use the returned reader.
    **/
    @:native("NewReader") static function newReader(r: go.io.ReaderAt, size: go.Int64): (go.Result<go.Pointer<go.archive.zip.Reader>>);
    /**
        NewWriter returns a new [Writer] writing a zip file to w.
    **/
    @:native("NewWriter") static function newWriter(w: go.io.Writer): (go.Pointer<go.archive.zip.Writer>);
    /**
        OpenReader will open the Zip file specified by name and return a ReadCloser.
        
        If any file inside the archive uses a non-local name
        (as defined by [filepath.IsLocal]) or a name containing backslashes
        and the GODEBUG environment variable contains `zipinsecurepath=0`,
        OpenReader returns the reader with an ErrInsecurePath error.
        A future version of Go may introduce this behavior by default.
        Programs that want to accept non-local names can ignore
        the ErrInsecurePath error and use the returned reader.
    **/
    @:native("OpenReader") static function openReader(name: String): (go.Result<go.Pointer<go.archive.zip.ReadCloser>>);
    /**
        RegisterCompressor registers custom compressors for a specified method ID.
        The common methods [Store] and [Deflate] are built in.
    **/
    @:native("RegisterCompressor") static function registerCompressor(method: go.UInt16, comp: go.archive.zip.Compressor): Void;
    /**
        RegisterDecompressor allows custom decompressors for a specified method ID.
        The common methods [Store] and [Deflate] are built in.
    **/
    @:native("RegisterDecompressor") static function registerDecompressor(method: go.UInt16, dcomp: go.archive.zip.Decompressor): Void;

}