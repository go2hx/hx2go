package go.archive.zip;

/**
    Writer implements a zip file writer.
**/
@:structInit
@:go.Type({ name: "Writer", instanceName: "zip.Writer", imports: ["archive/zip"] })
extern class Writer {

    /**
        AddFS adds the files from fs.FS to the archive.
        It walks the directory tree starting at the root of the filesystem
        adding each file to the zip using deflate while maintaining the directory structure.
    **/
    @:native("AddFS") function addFS(fsys: go.io.fs.FS): (go.Error);
    /**
        Close finishes writing the zip file by writing the central directory.
        It does not close the underlying writer.
    **/
    @:native("Close") function close(): (go.Error);
    /**
        Copy copies the file f (obtained from a [Reader]) into w. It copies the raw
        form directly bypassing decompression, compression, and validation.
    **/
    @:native("Copy") function copy(f: go.Pointer<go.archive.zip.File>): (go.Error);
    /**
        Create adds a file to the zip file using the provided name.
        It returns a [Writer] to which the file contents should be written.
        The file contents will be compressed using the [Deflate] method.
        The name must be a relative path: it must not start with a drive
        letter (e.g. C:) or leading slash, and only forward slashes are
        allowed. To create a directory instead of a file, add a trailing
        slash to the name. Duplicate names will not overwrite previous entries
        and are appended to the zip file.
        The file's contents must be written to the [io.Writer] before the next
        call to [Writer.Create], [Writer.CreateHeader], or [Writer.Close].
    **/
    @:native("Create") function create(name: String): (go.Result<go.io.Writer>);
    /**
        CreateHeader adds a file to the zip archive using the provided [FileHeader]
        for the file metadata. [Writer] takes ownership of fh and may mutate
        its fields. The caller must not modify fh after calling [Writer.CreateHeader].
        
        This returns a [Writer] to which the file contents should be written.
        The file's contents must be written to the io.Writer before the next
        call to [Writer.Create], [Writer.CreateHeader], [Writer.CreateRaw], or [Writer.Close].
    **/
    @:native("CreateHeader") function createHeader(fh: go.Pointer<go.archive.zip.FileHeader>): (go.Result<go.io.Writer>);
    /**
        CreateRaw adds a file to the zip archive using the provided [FileHeader] and
        returns a [Writer] to which the file contents should be written. The file's
        contents must be written to the io.Writer before the next call to [Writer.Create],
        [Writer.CreateHeader], [Writer.CreateRaw], or [Writer.Close].
        
        In contrast to [Writer.CreateHeader], the bytes passed to Writer are not compressed.
        
        CreateRaw's argument is stored in w. If the argument is a pointer to the embedded
        [FileHeader] in a [File] obtained from a [Reader] created from in-memory data,
        then w will refer to all of that memory.
    **/
    @:native("CreateRaw") function createRaw(fh: go.Pointer<go.archive.zip.FileHeader>): (go.Result<go.io.Writer>);
    /**
        Flush flushes any buffered data to the underlying writer.
        Calling Flush is not normally necessary; calling Close is sufficient.
    **/
    @:native("Flush") function flush(): (go.Error);
    /**
        RegisterCompressor registers or overrides a custom compressor for a specific
        method ID. If a compressor for a given method is not found, [Writer] will
        default to looking up the compressor at the package level.
    **/
    @:native("RegisterCompressor") function registerCompressor(method: go.UInt16, comp: go.archive.zip.Compressor): Void;
    /**
        SetComment sets the end-of-central-directory comment field.
        It can only be called before [Writer.Close].
    **/
    @:native("SetComment") function setComment(comment: String): (go.Error);
    /**
        SetOffset sets the offset of the beginning of the zip data within the
        underlying writer. It should be used when the zip data is appended to an
        existing file, such as a binary executable.
        It must be called before any data is written.
    **/
    @:native("SetOffset") function setOffset(n: go.Int64): Void;

}