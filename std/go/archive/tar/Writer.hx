package go.archive.tar;

/**
    Writer provides sequential writing of a tar archive.
    [Writer.WriteHeader] begins a new file with the provided [Header],
    and then Writer can be treated as an io.Writer to supply that file's data.
**/
@:structInit
@:go.Type({ name: "Writer", instanceName: "tar.Writer", imports: ["archive/tar"] })
extern class Writer {

    /**
        AddFS adds the files from fs.FS to the archive.
        It walks the directory tree starting at the root of the filesystem
        adding each file to the tar archive while maintaining the directory structure.
    **/
    @:native("AddFS") function addFS(fsys: go.io.fs.FS): (go.Error);
    /**
        Close closes the tar archive by flushing the padding, and writing the footer.
        If the current file (from a prior call to [Writer.WriteHeader]) is not fully written,
        then this returns an error.
    **/
    @:native("Close") function close(): (go.Error);
    /**
        Flush finishes writing the current file's block padding.
        The current file must be fully written before Flush can be called.
        
        This is unnecessary as the next call to [Writer.WriteHeader] or [Writer.Close]
        will implicitly flush out the file's padding.
    **/
    @:native("Flush") function flush(): (go.Error);
    /**
        Write writes to the current file in the tar archive.
        Write returns the error [ErrWriteTooLong] if more than
        Header.Size bytes are written after [Writer.WriteHeader].
        
        Calling Write on special types like [TypeLink], [TypeSymlink], [TypeChar],
        [TypeBlock], [TypeDir], and [TypeFifo] returns (0, [ErrWriteTooLong]) regardless
        of what the [Header.Size] claims.
    **/
    @:native("Write") function write(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    /**
        WriteHeader writes hdr and prepares to accept the file's contents.
        The Header.Size determines how many bytes can be written for the next file.
        If the current file is not fully written, then this returns an error.
        This implicitly flushes any padding necessary before writing the header.
    **/
    @:native("WriteHeader") function writeHeader(hdr: go.Pointer<go.archive.tar.Header>): (go.Error);

}